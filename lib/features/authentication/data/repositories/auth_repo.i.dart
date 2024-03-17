import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/utils/network/network_util.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/models/user/user_dto.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.dart';

class AuthRepoI extends AuthRepo {
  AuthRepoI({required AuthRemoteSource authRemoteSource})
      : _authRemoteSource = authRemoteSource;

  final AuthRemoteSource _authRemoteSource;

  @override
  Future<ApiResult<User>> getCurrentUser() async {
    return NetworkUtil().wrapRequest(() async {
      return _authRemoteSource
          .getCurrentUser()
          .then((value) => value.toEntity());
    });
  }

  @override
  Future<ApiResult<User>> login(
      {required String username, required String password}) async {
    return NetworkUtil().wrapRequest<User>(() async {
      return _authRemoteSource
          .login(username: username, password: password)
          .then((value) => value.toEntity());
    });
  }
}
