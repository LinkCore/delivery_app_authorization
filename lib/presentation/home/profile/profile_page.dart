import 'package:authorization/common/app_routes/app_routes.dart';
import 'package:authorization/common/extensions/build_context.dart';
import 'package:authorization/common/extensions/text_theme.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:authorization/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:authorization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(S.of(context).profileTitle),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Icon(
              CupertinoIcons.person_alt_circle_fill,
              color: CupertinoColors.black,
              size: 100,
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                profile.user.nickname,
                style: context.theme.textTheme.title,
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                profile.user.email,
                style: context.theme.textTheme.subtitle,
              ),
            ),
            const SizedBox(height: 20),
            CupertinoTheme(
              data:
                  context.theme.copyWith(primaryColor: const Color(0xFFFFFFFF)),
              child: CupertinoButton.filled(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignOutEvent());
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(AppRoutes.authGate);
                },
                borderRadius: BorderRadius.zero,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  S.of(context).signOutButton,
                  style: const TextStyle(color: CupertinoColors.destructiveRed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
