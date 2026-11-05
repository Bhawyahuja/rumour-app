import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'exceptions.dart';
import 'failures.dart';

abstract final class ErrorMapper {
  static Failure toFailure(Object error) {
    return switch (error) {
      NetworkException(:final message) => Failure.network(
        debugMessage: message,
      ),
      ServerException(:final message) => Failure.server(debugMessage: message),
      ParsingException(:final message) => Failure.server(debugMessage: message),
      CacheException(:final message) => Failure.unexpected(
        debugMessage: message,
      ),
      final FirebaseException e => _fromFirebase(e),
      final DioException e => _fromDio(e),
      SocketException() || TimeoutException() => const Failure.network(),
      _ => const Failure.unexpected(),
    };
  }

  static Failure _fromFirebase(FirebaseException e) {
    switch (e.code) {
      case 'unavailable':
      case 'deadline-exceeded':
        return Failure.network(debugMessage: e.message);
      case 'permission-denied':
      case 'unauthenticated':
        return Failure.permissionDenied(debugMessage: e.message);
      case 'resource-exhausted':
        return Failure.rateLimited(debugMessage: e.message);
      default:
        return Failure.server(debugMessage: '[${e.code}] ${e.message}');
    }
  }

  static Failure _fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.transformTimeout:
        return const Failure.network();
      case DioExceptionType.badResponse:
        return Failure.server(debugMessage: 'HTTP ${e.response?.statusCode}');
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return e.error is SocketException
            ? const Failure.network()
            : const Failure.unexpected();
    }
  }
}
