import 'package:equatable/equatable.dart';

abstract class BaseException extends Equatable implements Exception {
  final int statusCode;
  final String message;

  const BaseException({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}

class CacheException extends BaseException {
  const CacheException({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);

  CacheException.fromException({required Exception exception})
      : super(statusCode: 0, message: exception.toString());
}

class ServerException extends BaseException {
  const ServerException({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}
