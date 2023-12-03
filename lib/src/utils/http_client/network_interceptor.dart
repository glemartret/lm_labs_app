import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor implements Interceptor {
  final _ConnectivityRequestRetrier _requestRetrier;

  NetworkInterceptor(
    Dio dio,
  ) : _requestRetrier = _ConnectivityRequestRetrier(
          dio: dio,
        );

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      try {
        return handler.resolve(
          await _requestRetrier.scheduleRequestRetry(err.requestOptions),
        );
      } on DioException catch (e) {
        // Let any new error from the retrier pass through
        return handler.reject(e);
      }
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(options);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) =>
      handler.next(response);

  bool _shouldRetry(DioException err) =>
      err.type == DioExceptionType.connectionError &&
      err.error != null &&
      err.error is SocketException;
}

class _ConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity = Connectivity();

  _ConnectivityRequestRetrier({
    required this.dio,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        // We're connected either to WiFi or mobile data
        if (connectivityResult != ConnectivityResult.none) {
          // Ensure that only one retry happens per connectivity change by
          // cancelling the listener
          await streamSubscription.cancel();

          final options = Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          );

          // Copy & paste the failed request's data into the new request
          // And complete the completer instead of returning
          responseCompleter.complete(
            dio.request(
              requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              cancelToken: requestOptions.cancelToken,
              options: options,
              onSendProgress: requestOptions.onSendProgress,
              onReceiveProgress: requestOptions.onReceiveProgress,
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
