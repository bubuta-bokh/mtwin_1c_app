part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationGotAllTokens extends AuthenticationState {
  final UserCredentials userCreds;

  const AuthenticationGotAllTokens(this.userCreds);
  @override
  List<Object?> get props => [];
}

class AuthenticationGotUserCreds extends AuthenticationState {
  final UserCredentials userCreds;

  const AuthenticationGotUserCreds(this.userCreds);
  @override
  List<Object?> get props => [];
}
