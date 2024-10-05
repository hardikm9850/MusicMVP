import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

@module
abstract class ApiModule {
  Dio getDioClient() {
    final dio = Dio();
    // Enable request logging using Dio's built-in LogInterceptor
    dio.interceptors.add(LogInterceptor(
      request: true, // Logs the request data
      requestBody: true, // Logs the request body
      requestHeader: true, // Logs the headers
      responseBody: true, // Logs the response body
      responseHeader: false, // Doesn't log the response headers
      error: true, // Logs errors
      logPrint: (obj) {
        // Use logger for better readability
        Logger().d(obj);
      },
    ));

    return dio;
  }
}
