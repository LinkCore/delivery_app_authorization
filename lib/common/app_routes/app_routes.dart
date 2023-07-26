import 'package:authorization/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:authorization/domain/blocs/auto_login_bloc/auto_login_bloc.dart';
import 'package:authorization/presentation/auth/entry_page.dart';
import 'package:authorization/presentation/auth/sign_in_page/sign_in_page.dart';
import 'package:authorization/presentation/home/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRoutes {
  static const String signIn = 'signIn';
  static const String home = 'home';
  static const String authGate = 'authGate';

  static Route onGenerateRoutes(RouteSettings routeSettings) {
    Widget page;
    AuthBloc authBloc = AuthBloc();
    AutoLoginBloc autoLoginBloc = AutoLoginBloc();
    switch (routeSettings.name) {
      case home:
        page = BlocProvider<AuthBloc>(
          create: (context) => authBloc,
          child: HomePage(
              profile:
                  (routeSettings.arguments as Map<String, dynamic>)['profile']),
        );
      case signIn:
        page = BlocProvider<AuthBloc>(
          create: (context) => authBloc,
          child: const SignInPage(),
        );
      case authGate:
      default:
        page = BlocProvider<AutoLoginBloc>(
          create: (context) => autoLoginBloc..add(AutoLoginStartupEvent()),
          child: const EntryPage(),
        );
    }
    return CupertinoPageRoute(builder: (context) => page);
  }
}
