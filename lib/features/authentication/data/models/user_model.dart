import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.name, required super.age});

  factory UserModel.empty() {
    return const UserModel(name: '', age: 0);
  }

  factory UserModel.fromMap(DataMap dataMap) {
    return UserModel(
      name: dataMap['name'],
      age: dataMap['age'],
    );
  }

  DataMap toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  //generate copyWith
  UserModel copyWith({
    String? name,
    int? age,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
