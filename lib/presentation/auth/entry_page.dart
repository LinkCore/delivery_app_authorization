import 'package:authorization/common/app_routes/app_routes.dart';
import 'package:authorization/domain/blocs/auto_login_bloc/auto_login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AutoLoginBloc, AutoLoginState>(
      listener: (context, state) {
        switch (state) {
          case AutoLoginAllowedState state:
            Navigator.of(context).pushReplacementNamed(AppRoutes.home,
                arguments: {'profile': state.profile});
          case AutoLoginNotAllowedState _:
            Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
          default:
            () {};
        }
      },
      builder: (context, state) {
        return const CupertinoPageScaffold(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
