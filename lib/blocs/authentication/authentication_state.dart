part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {}

class UnInitialized extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  final AppUser user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class VerifyingAuth extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
