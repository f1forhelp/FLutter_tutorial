import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usecase.freezed.dart';

@freezed
class UseCase<Type, Params> with _$UseCase<Type, Params> {

  Future<> call(Params params)

  // const factory UseCase.idle() = Idle<T>;

  // const factory UseCase.loading() = Loading<T>;

  // const factory UseCase.loaded({T? data}) = Data<T>;

  // const factory UseCase.error({required NetworkExceptions error}) = Error<T>;
}

@freezed
class NoParams with _$NoParams {}

class EitherFailueOrType with _$EitherFailueOrType{
  
}