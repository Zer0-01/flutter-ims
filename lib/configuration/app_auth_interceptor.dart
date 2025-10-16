import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_ims/configuration/app_environment.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';
import 'package:flutter_ims/data/api_endpoints.dart';

class AppAuthInterceptor extends Interceptor {
  final AppSecureStorage appSecureStorage;
  final bool isUseAccessToken;

  final AppLogger _logger = AppLogger.getLogger("AppAuthInterceptor");

  bool _isRefreshing = false;
  final List<_PendingRequest> _pendingRequests = [];

  AppAuthInterceptor({
    required this.appSecureStorage,
    this.isUseAccessToken = true,
  });

  // ------------------- REQUEST -------------------
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!isUseAccessToken) return handler.next(options);

    final accessToken = await appSecureStorage.read(
      SecureStorageKeys.accessToken.name,
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  // ------------------- ERROR -------------------
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_isUnauthorized(err)) {
      return super.onError(err, handler);
    }

    final completer = Completer<Response>();
    _pendingRequests.add(_PendingRequest(err.requestOptions, completer));

    if (!_isRefreshing) {
      _isRefreshing = true;
      final refreshed = await _refreshToken();

      if (refreshed) {
        await _retryAllRequests();
      } else {
        _failAllRequests(err);
      }

      _isRefreshing = false;
    }

    try {
      final response = await completer.future;
      return handler.resolve(response);
    } catch (_) {
      return handler.reject(err);
    }
  }

  bool _isUnauthorized(DioException err) => err.response?.statusCode == 401;

  // ------------------- REFRESH TOKEN -------------------
  Future<bool> _refreshToken() async {
    final accessToken = await appSecureStorage.read(
      SecureStorageKeys.accessToken.name,
    );
    final refreshToken = await appSecureStorage.read(
      SecureStorageKeys.refreshToken.name,
    );

    if (accessToken == null || refreshToken == null) {
      _logger.error("Missing tokens — cannot refresh.");
      return false;
    }

    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ProfileConstants.api,
          contentType: Headers.jsonContentType,
        ),
      );

      final response = await refreshDio.post(
        ApiEndpoints.refresh,
        data: {'refresh_token': refreshToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      final newAccessToken = response.data?['data']?['access_token'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        _logger.error("Refresh token failed — invalid response");
        return false;
      }

      await appSecureStorage.save(
        SecureStorageKeys.accessToken.name,
        newAccessToken,
      );

      _logger.debug("Token refreshed successfully.");
      return true;
    } catch (e) {
      _logger.error("Refresh token request failed: $e");
      await appSecureStorage.clear();
      return false;
    }
  }

  // ------------------- RETRY -------------------
  Future<void> _retryAllRequests() async {
    final requests = List<_PendingRequest>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final pending in requests) {
      try {
        final newAccessToken = await appSecureStorage.read(
          SecureStorageKeys.accessToken.name,
        );

        final retryDio = Dio(
          BaseOptions(
            baseUrl: pending.requestOptions.baseUrl,
            contentType: Headers.jsonContentType,
          ),
        );

        pending.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';

        final response = await retryDio.request(
          pending.requestOptions.path,
          data: pending.requestOptions.data,
          queryParameters: pending.requestOptions.queryParameters,
          options: Options(
            method: pending.requestOptions.method,
            headers: pending.requestOptions.headers,
            contentType: pending.requestOptions.contentType,
            responseType: pending.requestOptions.responseType,
            followRedirects: pending.requestOptions.followRedirects,
            validateStatus: pending.requestOptions.validateStatus,
          ),
        );

        pending.completer.complete(response);
      } catch (e) {
        _logger.error("Retry request failed: $e");
        pending.completer.completeError(e);
      }
    }
  }

  void _failAllRequests(DioException err) {
    for (final pending in _pendingRequests) {
      pending.completer.completeError(err);
    }
    _pendingRequests.clear();
  }
}

// ------------------- MODEL -------------------
class _PendingRequest {
  final RequestOptions requestOptions;
  final Completer<Response> completer;
  _PendingRequest(this.requestOptions, this.completer);
}
