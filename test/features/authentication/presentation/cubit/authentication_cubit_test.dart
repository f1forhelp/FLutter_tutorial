import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/core/unions/api_result/api_result.dart';
import 'package:flutter_tutorial/core/unions/exception/exception.dart';
import 'package:flutter_tutorial/core/unions/ui_state/ui_state.dart';
import 'package:flutter_tutorial/features/authentication/domain/entities/user/user.dart';
import 'package:flutter_tutorial/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_tutorial/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUsecase {}

void main() {
  late AuthenticationCubit authenticationCubit;
  late LoginUsecase loginUsecase;

  setUpAll(() {
    registerFallbackValue(const LoginParams(username: "", password: ""));
  });

  setUp(() {
    loginUsecase = MockLoginUseCase();
    authenticationCubit = AuthenticationCubit(loginUsecase: loginUsecase);
  });

  tearDown(() {
    // verifyNoMoreInteractions(loginUsecase);
  });

  setUp(() => resetMocktailState());
  setUp(() => reset(loginUsecase));

  group('SUT - login', () {
    test("Should complete with success ✅", () async {
      when(() => loginUsecase(any())).thenAnswer((invocation) async =>
          await Future.value(ApiResult.sucess(
              User(id: 1, userName: "_user.empty", token: "_user.token"))));
      await authenticationCubit.login(
          loginParams: const LoginParams(username: "", password: ""));
      expect(authenticationCubit.state.loginState, isA<UiStateSuccess>());
      expect(
          authenticationCubit.state.loginState,
          UiState.success(
              User(id: 1, userName: "_user.empty", token: "_user.token")));
      verify(() => loginUsecase(any())).called(1);
    });

    test("Should fail with exception ✅", () async {
      when(() => loginUsecase(any())).thenAnswer((invocation) async =>
          await Future.value(ApiResult.failure(
              CallException.api(statusCode: 400, message: ""))));
      await authenticationCubit.login(
          loginParams: const LoginParams(username: "", password: ""));
      expect(authenticationCubit.state.loginState, isA<UiStateFailure>());
      expect(
          authenticationCubit.state.loginState,
          UiState<User>.failure(
              CallException.api(statusCode: 400, message: "")));
      verify(() => loginUsecase(any())).called(1);
    });

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits [MyState] when MyEvent is added.',
      build: () {
        when(() => loginUsecase(any())).thenAnswer((invocation) async =>
            Future.value(ApiResult.sucess(User(id: 0, userName: ""))));
        return authenticationCubit;
      },
      act: (bloc) => bloc.login(
          loginParams: const LoginParams(username: "", password: "")),
      expect: () => [
        AuthenticationState(loginState: UiState.laoding()),
        AuthenticationState(
            loginState: UiState.success(User(id: 0, userName: ""))),
      ],
    );
    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits [MyState] when MyEvent is added.',
      build: () {
        when(() => loginUsecase(any())).thenAnswer((invocation) async =>
            Future.value(ApiResult.sucess(User(id: 0, userName: ""))));
        return authenticationCubit;
      },
      act: (bloc) => bloc.login(
          loginParams: const LoginParams(username: "", password: "")),
      expect: () => [
        AuthenticationState(loginState: UiState.laoding()),
        AuthenticationState(
            loginState: UiState.success(User(id: 0, userName: ""))),
      ],
      verify: (bloc) {
        verify(
          () => loginUsecase(any()),
        ).called(1);
      },
    );
  });
}
