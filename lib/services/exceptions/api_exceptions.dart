class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException: $message${statusCode != null ? ' (Status code: $statusCode)' : ''}';
}

// Custom Exceptions extending ApiException

class NetworkException extends ApiException {
  NetworkException({required super.message, super.statusCode});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required super.message, super.statusCode});
}

class BadRequestException extends ApiException {
  BadRequestException({required super.message, super.statusCode});
}

class NotFoundException extends ApiException {
  NotFoundException({required super.message, super.statusCode});
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({required super.message, super.statusCode});
}
