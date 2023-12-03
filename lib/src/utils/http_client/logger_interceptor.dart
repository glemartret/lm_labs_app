import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${DateTime.now()}');
    log('❌ Dio Error!');
    log('❌ Url: ${err.requestOptions.uri}');
    log('❌ ${err.stackTrace}');
    log('❌ Response Error: ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('${DateTime.now()}');
    log('🌍 Sending network request: ${options.baseUrl}${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${DateTime.now()}');
    log('⬅️ Received network response');
    final statusCode =
        response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅';
    log('$statusCode '
        '${response.requestOptions.baseUrl}${response.requestOptions.path}');
    log('Query params: ${response.requestOptions.queryParameters}');
    log('Response: ${response.data}');
    log('-------------------------');
    return handler.next(response);
  }
}
