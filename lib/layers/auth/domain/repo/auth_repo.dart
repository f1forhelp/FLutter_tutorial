import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/layers/auth/domain/entity/signin/signin_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<SignInEntity>> signIn({
    required String email,
    required String password,
  });
}
