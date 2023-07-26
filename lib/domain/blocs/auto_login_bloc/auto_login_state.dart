part of 'auto_login_bloc.dart';

@immutable
sealed class AutoLoginState {}

class AutoLoginInitialState extends AutoLoginState {}

class AutoLoginAllowedState extends AutoLoginState {
  final Profile profile;

  AutoLoginAllowedState(this.profile);
}

class AutoLoginNotAllowedState extends AutoLoginState {}
