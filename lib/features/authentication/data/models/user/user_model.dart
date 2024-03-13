import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

//Making this class freezed for testing purpose.
//Created empty constructor for comparison while testing.
//Dosent provided default values to fields as we can provide them on entity(Coz they are core part of functionality).
@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? userName,
    String? image,
    String? token,
  }) = _UserModel;

  factory UserModel.empty() => const UserModel(
        id: 0,
        userName: "_userName.empty",
        image: "",
        token: "_token.empty",
      );

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
