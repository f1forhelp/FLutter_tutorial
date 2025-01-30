import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/layers/auth/domain/entity/signin/signin_entity.dart';
import 'package:flutter_tutorial/layers/auth/domain/repo/auth_repo.dart';

class SignInUseCase {
  SignInUseCase({
    required this.authRepo,
  });

  final AuthRepo authRepo;

  Future<ApiResult<SignInEntity>> call({
    required String email,
    required String password,
  }) {
    return authRepo.signIn(
      email: email,
      password: password,
    );
  }
}
