import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:photo_gallery/app/view/logger/app_logger.dart';
import 'package:photo_gallery/photo_gallery/data/models/unsplash_error/unsplash_error.dart';

/// Utility class to manipulate error returned from the server
class ErrorUtils {
  static String unknownError = 'Unknown Error';

  static String getErrorMessage(Object e, StackTrace st) {
    logger..e(e)
    ..e(st);
    if (e is DioException) {
      if (e.response != null) {
        final map = jsonDecode(e.response.toString());
        final error = UnsplashError.fromJson(map as Map<String, dynamic>);
        return error.errors?.join('\n') ?? unknownError;
      }
    }
    return unknownError;
  }
}
