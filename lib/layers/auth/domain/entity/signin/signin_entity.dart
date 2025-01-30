import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_entity.freezed.dart';

@freezed
class SignInEntity with _$SignInEntity {
  factory SignInEntity({
    required String userName,
    required String firstName,
    required String lastName,
  }) = _SignInEntity;
}
