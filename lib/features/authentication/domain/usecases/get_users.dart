import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/core/usecase/usecase.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/authnetication_repo.i.dart';

class GetUsers extends UseCaseWithoutParmas<List<UserEntity>> {
  GetUsers(this._authenticationRepoI);

  final AuthenticationRepoI _authenticationRepoI;

  @override
  ResultFuture<List<UserEntity>> call() {
    return _authenticationRepoI.getUsers();
  }
}
