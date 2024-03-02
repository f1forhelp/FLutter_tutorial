// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_tutorial/core/constants/typedef.dart';
import 'package:flutter_tutorial/core/usecase/usecase.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.i.dart';

class AddUser extends UseCaseWithParams<void, AddUserParams> {
  const AddUser(this._authenticationRepoI);

  final AuthRepoI _authenticationRepoI;

  @override
  ResultFuture<void> call(params) {
    return _authenticationRepoI.addUser(name: params.name, age: params.age);
  }
}

class AddUserParams extends Equatable {
  final String name;
  final int age;
  const AddUserParams({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}
