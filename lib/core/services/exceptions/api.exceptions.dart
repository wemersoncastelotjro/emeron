class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException: $message ${statusCode != null ? '(Status Code: $statusCode)' : ''}';
}

class ApiUnauthorizedException extends ApiException {
  ApiUnauthorizedException() : super(message: 'Não autorizado', statusCode: 401);
}

class ApiForbiddenException extends ApiException {
  ApiForbiddenException() : super(message: 'Acesso negado', statusCode: 403);
}

class ApiNotFoundException extends ApiException {
  ApiNotFoundException() : super(message: 'Recurso não encontrado', statusCode: 404);
}
