import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ApiResult<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ApiResult<Type> call();
}
