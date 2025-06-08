 import 'package:base_nest/config/network_config.dart';
import 'package:base_nest/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: NetworkConfig.headers,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    // Add interceptors
    dio.interceptors.add(_loggingInterceptor());

    // Add retry logic
    // Attach retry
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: (message) => LoggerService.warning(message),
        toNoInternetPageNavigator: () {
          return Future.delayed(const Duration(seconds: 1));
        },

        retries: 2,
        retryDelays: const [Duration(seconds: 2), Duration(seconds: 4)],
      ),
    );
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        LoggerService.debug('➡️ REQUEST: [${options.method}] ${options.uri}');
        LoggerService.debug('Headers: ${options.headers}');
        LoggerService.debug('Data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        LoggerService.debug(
          '✅ RESPONSE: [${response.statusCode}] ${response.requestOptions.uri}',
        );
        LoggerService.debug('Response Data: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        LoggerService.error(
          '❌ ERROR: [${error.response?.statusCode}] ${error.requestOptions.uri}',
        );
        LoggerService.error('Error Message: ${error.message}');
        return handler.next(error);
      },
    );
  }
}
