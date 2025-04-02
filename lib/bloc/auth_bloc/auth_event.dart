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
  final AppConfig config;

  const GetEnvironmentVarEvent({required this.config});
  @override
  List<Object> get props => [config];
}

class SetEnvironmentVarEvent extends AuthenticationEvent {
  final AppConfig config;
  final bool wasEdited;

  const SetEnvironmentVarEvent({required this.config, required this.wasEdited});
  @override
  List<Object> get props => [config, wasEdited];
}

class SetEnviEvent extends AuthenticationEvent {
  final String envi;
  final bool wasEdited;

  const SetEnviEvent({required this.envi, required this.wasEdited});
  @override
  List<Object> get props => [envi, wasEdited];
}
