import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user_entity.dart';

abstract class AuthenticationRepoI {
  const AuthenticationRepoI();

  ResultFuture<List<UserEntity>> getUsers();

  ResultVoid addUser({required String name, required int age});
}
