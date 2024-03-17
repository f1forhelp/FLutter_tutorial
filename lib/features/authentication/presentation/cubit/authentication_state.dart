part of 'authentication_cubit.dart';

@Freezed()
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    required UiState<User> loginState,
  }) = _AuthenticationState;
}
