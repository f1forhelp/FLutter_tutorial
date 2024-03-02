import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepoI {
  const AuthRepoI();

  ResultFuture<List<UserEntity>> getUsers();

  ResultFuture<UserEntity> getUser({required int userId});

  ResultVoid addUser({required String name, required int age});
}
