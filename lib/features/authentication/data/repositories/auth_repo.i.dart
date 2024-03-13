import 'dart:io';

import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/unions/exception/exception.dart';
import 'package:flutter_tutorial/core/utils/network/network_util.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_model.dart';
import 'package:flutter_tutorial/features/authentication/domain/entity/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dio/dio.dart';

class AuthRepoI extends AuthRepo {
  AuthRepoI({required AuthRemoteSource authRemoteSource})
      : _authRemoteSource = authRemoteSource;

  final AuthRemoteSource _authRemoteSource;

  @override
  Future<ApiResult<User>> getCurrentUser() async {
    return NetworkUtil().wrapRequest(() async {
      UserModel userModel = await _authRemoteSource.getCurrentUser();
      User defaultUser = User();
      return User(
        id: userModel.id ?? defaultUser.id,
        image: userModel.image ?? defaultUser.image,
        userName: userModel.userName ?? defaultUser.userName,
      );
    });
  }

  // Future<ApiResult<User>> login({String username, String password});
  @override
  Future<ApiResult<User>> login(
      {required String username, required String password}) async {
    return NetworkUtil().wrapRequest<User>(() async {
      UserModel res = await _authRemoteSource.login();

      User().copyWith(
        id: res.id,
        image: res.image,
        token: res.token,
        // userName: null,
      );

      return User(
        id: res.id,
        image: res.image,
        token: res.token,
      );
    });
  }
}

class SampleClass {
  final String name;

  SampleClass({String? name}) : this.name = name ?? "";
}
