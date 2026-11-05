import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';

/// Builds the app's configured [Dio] instance.
abstract final class DioClient {
  static Dio create({String baseUrl = AppConstants.randomUserBaseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: AppConstants.networkTimeout,
        receiveTimeout: AppConstants.networkTimeout,
        sendTimeout: AppConstants.networkTimeout,
        headers: const {'Accept': 'application/json'},
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          logPrint: (o) => debugPrint('[dio] $o'),
        ),
      );
    }
    return dio;
  }
}
