// core/api/api_client.dart
import 'package:dikshyalaya_v2/app/app_config.dart';
import 'package:dikshyalaya_v2/core/api/api_interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl, // Replace with actual URL
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  )) {
    dio.interceptors.add(APIInterceptor());
  }
}