import 'dart:async';

import 'package:book_mate/models/app_user.dart';
import 'package:book_mate/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepostory) : super(UnInitialized()) {
    on<IsAuthenticated>(_handleVerifyUserAuth);
  }

  final AuthenticationRepostory _authenticationRepostory;

  FutureOr<void> _handleVerifyUserAuth(
      IsAuthenticated event, Emitter<AuthenticationState> emit) async {
    emit(VerifyingAuth());
    bool isAuthenticated = await _authenticationRepostory.isLoggedIn();
    if (isAuthenticated) {
      emit(Authenticated(AppUser()));
    } else {
      emit(UnAuthenticated());
    }
  }
}
