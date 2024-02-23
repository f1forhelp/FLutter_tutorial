import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}

class CacheFailure extends Failure {
  const CacheFailure({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);

  CacheFailure.fromException({required Exception exception})
      : super(statusCode: 0, message: exception.toString());
}

class ServerFailure extends Failure {
  const ServerFailure({required int statusCode, required String message})
      : super(statusCode: statusCode, message: message);
}
