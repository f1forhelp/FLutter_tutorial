import 'package:dio/dio.dart';
import 'package:flutter_tutorial/core/utils/constants/export.dart';
import 'package:flutter_tutorial/features/authentication/data/datasources/auth_remote_source.dart';
import 'package:flutter_tutorial/features/authentication/data/repositories/auth_repo.i.dart';
import 'package:flutter_tutorial/features/authentication/domain/repositories/auth_repo.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tutorial/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:get_it/get_it.dart';

class AppDi {
  static final AppDi _obj = AppDi._inaternal();
  factory AppDi() => _obj;
  AppDi._inaternal();

  late GetIt di;

  init() {
    di = GetIt.I;
    _authentication();
  }

  _authentication() {
    di.registerFactory<AuthenticationCubit>(
        () => AuthenticationCubit(loginUsecase: di()));
    di.registerLazySingleton<LoginUsecase>(() => LoginUsecase(di()));
    di.registerLazySingleton<GetCurrentUserUsecase>(
        () => GetCurrentUserUsecase(di()));
    di.registerLazySingleton<AuthRepo>(() => AuthRepoI(authRemoteSource: di()));
    di.registerLazySingleton<AuthRemoteSource>(
        () => AuthRemoteSource(Dio(BaseOptions(baseUrl: KApi.baseUrl))));
  }
}
