import 'package:freezed_annotation/freezed_annotation.dart';
part "user.freezed.dart";
part 'user.g.dart';

//Using freezed for immutability and passing of default values.
@JsonSerializable(
  checked: true,
)
@Freezed(
  fromJson: true,
)
class User with _$User {
  // factory User.copyWith({
  //   int? id,
  //   String? userName,
  //   String? image,
  //   String? token,
  // }) {
  //   return User(
  //     id: id ?? this.id,
  //   );
  // }

  //If we get nullable just make it nullable remove default value.
  //We may not be able to use null functionality for checks.
  factory User({
    @Default(0) int? id,
    @Default("") String userName,
    @Default("") String? image,
    @Default("") String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// class UserTemp {
//   final String name;

//   UserTemp({this.name});
// }
