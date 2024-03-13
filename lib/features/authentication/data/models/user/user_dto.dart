import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/features/authentication/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dto.g.dart';

//Making this class freezed for testing purpose.
//Created empty constructor for comparison while testing.
//Dosent provided default values to fields as we can provide them on entity(Coz they are core part of functionality).

@JsonSerializable()
class UserDto with EquatableMixin {
  int id;
  String userName;
  String? image;
  String? token;

  UserDto({
    required this.id,
    required this.userName,
    this.image,
    this.token,
  });

  factory UserDto.empty() => UserDto(
        id: 0,
        userName: "_userName.empty",
        image: "",
        token: "_token.empty",
      );

  factory UserDto.fromJson(Map<String, Object?> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  List<Object?> get props => [id, userName, image, token];
}

extension UserMapper on UserDto {
  User toEntity() {
    return User(
      id: id,
      userName: userName,
      image: image,
      token: token,
    );
  }
}
