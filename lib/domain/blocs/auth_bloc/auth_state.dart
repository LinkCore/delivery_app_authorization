part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {
  final Profile profile;

  AuthSuccessState(this.profile);
}

class AuthErrorState extends AuthState {
  final String errorText;

  AuthErrorState({required this.errorText});
}

class AuthLoadingState extends AuthState {}
