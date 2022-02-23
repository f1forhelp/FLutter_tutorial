import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart'; //This need to be same as current file name

@freezed
class User with _$User {
  const factory User({required String name, int? age}) = _User;
}
