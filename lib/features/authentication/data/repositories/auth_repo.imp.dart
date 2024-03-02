// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/core/error/exception.dart';
import 'package:flutter_tutorial/core/error/failure.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.i.dart';

class AuthRepoImp extends AuthRepoI {
  AuthRepoImp(this._authRemoteSource);

  final AuthRemoteSource _authRemoteSource;

  @override
  ResultVoid addUser({required String name, required int age}) async {
    try {
      await _authRemoteSource.addUser(name: name, age: age);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(statusCode: statusCode, message: message));
    }
  }

  @override
  ResultFuture<List<UserEntity>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  ResultFuture<UserEntity> getUser({required int userId}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
