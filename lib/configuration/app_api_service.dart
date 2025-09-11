import 'package:dio/dio.dart';
import 'package:flutter_ims/configuration/app_environment.dart';

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
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: contentType ?? Headers.jsonContentType,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
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
