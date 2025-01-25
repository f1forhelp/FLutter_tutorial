import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/usecase/usecase.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.dart';

class LoginUsecase extends UseCaseWithParams<User, LoginParams> {
  final AuthRepo _authRepo;

  LoginUsecase(this._authRepo);

  @override
  Future<ApiResult<User>> call(LoginParams params) {
    return _authRepo.login(
        username: params.username, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
