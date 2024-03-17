import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';

abstract class AuthRepo {
  Future<ApiResult<User>> getCurrentUser();
  Future<ApiResult<User>> login(
      {required String username, required String password});
}
