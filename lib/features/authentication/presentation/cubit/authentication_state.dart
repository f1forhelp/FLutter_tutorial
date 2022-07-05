part of 'authentication_cubit.dart';

abstract class AuthenticationState {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
