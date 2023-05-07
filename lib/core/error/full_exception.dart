import 'package:equatable/equatable.dart';

class ServerFullException extends Equatable implements Exception {
  final String? message;

  const ServerFullException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerFullException {
  const FetchDataException([message]) : super("Error During Communication");
}

class ResultNotFoundException extends ServerFullException {
  const ResultNotFoundException ([message]) : super("Result Not Found");
}

class BadRequestException extends ServerFullException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerFullException {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerFullException {
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerFullException {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerFullException {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerFullException {
  const NoInternetConnectionException([message])
      : super("No Internet Connection");
}

class CacheException implements Exception {}