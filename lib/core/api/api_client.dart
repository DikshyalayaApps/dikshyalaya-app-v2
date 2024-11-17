// core/api/api_client.dart
import 'package:dikshyalaya_v2/app/app_config.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl, // Replace with actual URL
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  )) {
    dio.interceptors.add(_CustomInterceptor());
  }
}

class _CustomInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('accessToken'); // Fetch access token
      final appId = AppConfig.appId; // Fetch app ID

      // Check for mandatory appId
      if (appId.isEmpty) {
        // Cancel the request with an error
        handler.reject(DioException(
          requestOptions: options,
          error: 'App ID is missing. Cannot proceed with the request.',
          type: DioExceptionType.cancel,
        ));
        return;
      }

      // Add headers
      options.headers['Authorization'] =
          accessToken != null ? 'Bearer $accessToken' : '';
      options.headers['App-ID'] = appId;

      // Proceed with the request
      handler.next(options);
    } catch (error) {
      // Handle errors in header configuration
      handler.reject(DioException(
        requestOptions: options,
        error: 'Failed to configure request headers: $error',
        type: DioExceptionType.unknown,
      ));
    }
  }
}