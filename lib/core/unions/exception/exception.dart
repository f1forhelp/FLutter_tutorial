import 'package:freezed_annotation/freezed_annotation.dart';
part "exception.freezed.dart";

enum ExceptionType { socket, format, other }

@freezed
class CallException with _$CallException {
  factory CallException.api({
    required int statusCode,
    required String message,
  }) = _Api;
  factory CallException.other({
    required String message,
    required ExceptionType exceptionType,
  }) = _Socket;
}
