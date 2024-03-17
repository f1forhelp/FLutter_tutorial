import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/unions/ui_state/ui_state.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/login_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({required LoginUsecase loginUsecase})
      : _loginUsecase = loginUsecase,
        super(AuthenticationState(
          loginState: UiState.initial(),
        ));

  final LoginUsecase _loginUsecase;

  login({required LoginParams loginParams}) async {
    emit(state.copyWith(loginState: UiState.laoding()));
    ApiResult<User> res = await _loginUsecase.call(loginParams);
    res.when(
      sucess: (v) {
        emit(state.copyWith(loginState: UiState.success(v)));
      },
      failure: (callException) {
        emit(state.copyWith(loginState: UiState.failure(callException)));
      },
    );
  }
}
