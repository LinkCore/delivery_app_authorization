import 'dart:async';

import 'package:authorization/data/repositories/auth_repository.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthSignInEvent>(_onAuthSignInEvent);
    on<AuthSignOutEvent>(_onAuthSignOutEvent);
  }

  final AuthRepository _repository = AuthRepository();

  Future<void> _onAuthSignInEvent(
    AuthSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      Profile profile = await _repository.signIn(
          email: event.email, password: event.password);
      emit(AuthSuccessState(profile));
    } on Exception catch (e) {
      emit(AuthErrorState(errorText: e.toString()));
    }
  }

  FutureOr<void> _onAuthSignOutEvent(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) {
    _repository.signOut();
    emit(AuthInitialState());
  }
}
