import 'package:dartz/dartz.dart';
import 'package:flutter_tutorial/core/constants/typedef.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParmas<Type> {
  const UseCaseWithoutParmas();

  ResultFuture<Type> call();
}
