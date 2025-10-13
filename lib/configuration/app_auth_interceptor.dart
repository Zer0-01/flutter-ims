import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';

class AppAuthInterceptor extends Interceptor {
  final Dio dio;
  final AppSecureStorage appSecureStorage;
  bool _isRefreshing = false;
  final List<_PendingRequest> _pendingRequests = [];
  final bool isUseToken;

  final AppLogger _logger = AppLogger.getLogger("AppAuthInterceptor");

  AppAuthInterceptor({
    required this.dio,
    required this.appSecureStorage,
    this.isUseToken = true,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!isUseToken) {
      return handler.next(options);
    }

    final String? accessToken = await appSecureStorage.read(
      SecureStorageKeys.accessToken.name,
    );
    _logger.debug("accessToken: $accessToken");

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_isUnauthorized(err)) {
      _pendingRequests.add(
        _PendingRequest(err.requestOptions, Completer<Response>()),
      );

      if (!_isRefreshing) {
        _isRefreshing = true;
        final refreshed = await _refreshToken();
        if (refreshed) {
          await _retryAllRequest();
        } else {
          _failAllRequest(err);
        }
        _isRefreshing = false;
      }

      try {
        final last = _pendingRequests.last;
        final response = await last.completer.future;
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return super.onError(err, handler);
  }

  bool _isUnauthorized(DioException err) {
    return err.response?.statusCode == 401;
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await appSecureStorage.read(
      SecureStorageKeys.refreshToken.name,
    );
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      final Dio dio = Dio();
      final response = await dio.post(
        "Later",
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );
      final newToken = response.data["accessToken"];
      final newRefreshToken = response.data["refreshToken"];

      if (newToken != null &&
          newToken.isNotEmpty &&
          newRefreshToken != null &&
          newRefreshToken.isNotEmpty) {
        await appSecureStorage.save(
          SecureStorageKeys.accessToken.name,
          newToken,
        );
        await appSecureStorage.save(
          SecureStorageKeys.refreshToken.name,
          newRefreshToken,
        );
        return true;
      }

      return false;
    } catch (e) {
      await appSecureStorage.clear();
      return false;
    }
  }

  Future<void> _retryAllRequest() async {
    final request = List<_PendingRequest>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final pending in request) {
      try {
        final newAccessToken = await appSecureStorage.read(
          SecureStorageKeys.accessToken.name,
        );
        pending.requestOptions.headers['Authorization'] =
            "Bearer $newAccessToken";
        final response = await dio.request(pending.requestOptions.path);
        pending.completer.complete(response);
      } catch (e) {
        pending.completer.completeError(e);
      }
    }
  }

  void _failAllRequest(DioException err) {
    for (final pending in _pendingRequests) {
      pending.completer.completeError(err);
    }
    _pendingRequests.clear();
  }
}

class _PendingRequest {
  final RequestOptions requestOptions;
  final Completer<Response> completer;

  _PendingRequest(this.requestOptions, this.completer);
}
