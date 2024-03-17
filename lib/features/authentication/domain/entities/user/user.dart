import 'package:freezed_annotation/freezed_annotation.dart';
part "user.freezed.dart";

@Freezed()
class User with _$User {
  factory User({
    required int id,
    required String userName,
    //Leaving below fields as empty as they can be used in ui based on some condition.
    String? image,
    String? token,
  }) = _User;
}
