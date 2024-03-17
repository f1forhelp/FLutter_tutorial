import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/usecase/usecase.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.dart';

class GetCurrentUserUsecase extends UseCaseWithoutParams<User> {
  final AuthRepo _authRepo;

  GetCurrentUserUsecase(this._authRepo);
  @override
  Future<ApiResult<User>> call() async {
    return _authRepo.getCurrentUser();
  }
}
