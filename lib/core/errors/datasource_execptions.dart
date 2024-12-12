import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';


enum DatasourceError { connectionError, invalidData, notFound, serverError, unauthorized, timeout, unknown }

class DatasourceException implements Exception {
  final String message;
  final DatasourceError error;
  final dynamic stackTrace;
  final int? statusCode;
  final String? rawError;

  DatasourceException({
    required this.message,
    this.error = DatasourceError.unknown,
    this.stackTrace,
    this.statusCode,
    this.rawError,
  });

  factory DatasourceException.fromError(dynamic error) {
    if (error is TimeoutException) {
      return DatasourceException(
        message: 'A conexão expirou. Tente novamente.',
        error: DatasourceError.timeout,
        stackTrace: error,
        rawError: error.toString(),
      );
    }

    if (error is SocketException) {
      return DatasourceException(
        message: 'Erro de conexão. Verifique sua internet.',
        error: DatasourceError.connectionError,
        stackTrace: error,
        rawError: error.toString(),
      );
    }

    // Para erros HTTP
    if (error is Response || error.runtimeType.toString().contains('Response')) {
      final statusCode = error.statusCode as int;
      final body = error.body;

      switch (statusCode) {
        case 400:
          return DatasourceException(
            message: 'Dados inválidos',
            error: DatasourceError.invalidData,
            statusCode: statusCode,
            rawError: body.toString(),
          );
        case 401:
          return DatasourceException(
            message: 'Não autorizado',
            error: DatasourceError.unauthorized,
            statusCode: statusCode,
            rawError: body.toString(),
          );
        case 404:
          return DatasourceException(
            message: 'Recurso não encontrado',
            error: DatasourceError.notFound,
            statusCode: statusCode,
            rawError: body.toString(),
          );
        case 500:
          return DatasourceException(
            message: 'Erro interno do servidor',
            error: DatasourceError.serverError,
            statusCode: statusCode,
            rawError: body.toString(),
          );
        default:
          return DatasourceException(
            message: 'Erro desconhecido',
            error: DatasourceError.unknown,
            statusCode: statusCode,
            rawError: body.toString(),
          );
      }
    }

    return DatasourceException(
      message: 'Erro desconhecido',
      error: DatasourceError.unknown,
      stackTrace: error is Error ? error.stackTrace : null,
      rawError: error.toString(),
    );
  }

  @override
  String toString() {
    var error = 'DatasourceException: $message';
    if (statusCode != null) {
      error += ' (Status Code: $statusCode)';
    }
    if (rawError != null) {
      error += '\nRaw Error: $rawError';
    }
    return error;
  }
}
