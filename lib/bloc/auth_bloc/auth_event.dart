part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return 'LoggedIn(token: $token)';
  }
}

class DoLogOut extends AuthenticationEvent {}

class LoginButtonPressed extends AuthenticationEvent {}

class GetEnvironmentVarEvent extends AuthenticationEvent {
  final String envi;

  const GetEnvironmentVarEvent({required this.envi});
  @override
  List<Object> get props => [envi];
}
