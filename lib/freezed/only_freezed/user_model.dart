import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_model.dart';
part 'user_model.freezed.dart'; //This need to be same as current file name
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String name, int? age, required List<Job> jobs}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
