import 'package:dio/dio.dart';
import 'package:flutter_ims/configuration/app_auth_interceptor.dart';
import 'package:flutter_ims/configuration/app_environment.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';

enum DioMethod { post, get, put, delete }

class AppApiService {
  AppApiService._singleton();
  static final AppApiService instance = AppApiService._singleton();

  String get baseUrl {
    return ProfileConstants.api;
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    formData,
    bool isUseAccessToken = true,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: contentType ?? Headers.jsonContentType,
      ),
    );

    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
      AppAuthInterceptor(
        dio: dio,
        appSecureStorage: AppSecureStorage(),
        isUseAccessToken: isUseAccessToken,
      ),
    ]);
    switch (method) {
      case DioMethod.post:
        return dio.post(endpoint, data: param ?? formData);
      case DioMethod.get:
        return dio.get(endpoint, queryParameters: param);
      case DioMethod.put:
        return dio.put(endpoint, data: param ?? formData);
      case DioMethod.delete:
        return dio.delete(endpoint, data: param ?? formData);
    }
  }
}
