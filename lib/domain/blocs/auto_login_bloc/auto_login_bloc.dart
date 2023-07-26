import 'dart:async';

import 'package:authorization/data/repositories/auth_repository.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auto_login_event.dart';

part 'auto_login_state.dart';

class AutoLoginBloc extends Bloc<AutoLoginEvent, AutoLoginState> {
  AutoLoginBloc() : super(AutoLoginInitialState()) {
    on<AutoLoginStartupEvent>(_onAutoLoginStartupEvent);
  }

  final AuthRepository _repository = AuthRepository();

  Future<void> _onAutoLoginStartupEvent(
    AutoLoginStartupEvent event,
    Emitter<AutoLoginState> emit,
  ) async {
    try {
      final Profile profile = await _repository.allowAutoLogin();
      emit(AutoLoginAllowedState(profile));
    } on Exception catch (e) {
      emit(AutoLoginNotAllowedState());
    }
  }
}
