import 'package:flutter_tutorial/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_exception.freezed.dart';

@freezed
class CallException with _$CallException {
  factory CallException({
    required CallError callError,
    required String message,
  }) = _CallException;
}
