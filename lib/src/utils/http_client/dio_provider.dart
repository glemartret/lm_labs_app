import 'package:dio/dio.dart';
import 'package:lm_labs_app/src/utils/http_client/logger_interceptor.dart';
import 'package:lm_labs_app/src/utils/http_client/network_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors
    ..add(LoggerInterceptor())
    ..add(NetworkInterceptor(dio));
  return dio;
}
