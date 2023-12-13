import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:photo_gallery/app/key/unsplash_env.dart';
import 'package:photo_gallery/app/view/logger/app_logger.dart';

/// A class to handle DIO API request
class Api {
  Api._internal() {
    logger.i('Initializing API client...');
  }

  static const _baseUrlUnSplash = 'https://api.unsplash.com/';
  static final List<Interceptor> interceptors = [
    MyInterceptor(),
  ];
  static final Api _instance = Api._internal();

  /// Production environment
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: _baseUrlUnSplash,
    ),
  )..interceptors.addAll(interceptors);

  /// Staging environment
  final Dio _dioStaging = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: _baseUrlUnSplash,
    ),
  )..interceptors.addAll(interceptors);

  /// Development environment
  final Dio _dioDev = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: _baseUrlUnSplash,
    ),
  )..interceptors.addAll(interceptors);

  static Dio get client => _instance._dio;

  static Dio get stagingClient => _instance._dioStaging;

  static Dio get devClient => _instance._dioDev;
}

/// Interceptor to handle and modify requests, responses, and errors
class MyInterceptor extends Interceptor {
  ///to format data response
  final JsonEncoder _encoder = const JsonEncoder.withIndent(' ');

  void _log(String url, [dynamic data]) {
    if (data is Map) {
      final prettyPrint = _encoder.convert(data);
      developer.log(
        url,
        name: 'unsplash.api',
        error: prettyPrint,
      );
    } else {
      developer.log(
        url,
        name: 'unsplash.api',
      );
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _log('=> ${options.method} ${options.uri}', options.data);
    options.headers['Authorization'] = 'Client-ID ${UnsplashEnv.accessKey}';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.requestOptions.method == 'POST') {
      _log(
        'Resp =>${response.requestOptions.method}'
            '${response.requestOptions.uri}',
        response.data,
      );
    }
    super.onResponse(response, handler);
  }

// @override
// void onError(DioException err, ErrorInterceptorHandler handler) {
//
//   super.onError(err, handler);
// }
}
