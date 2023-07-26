import 'package:authorization/common/app_routes/app_routes.dart';
import 'package:authorization/common/extensions/build_context.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:authorization/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:authorization/generated/l10n.dart';
import 'package:authorization/presentation/auth/sign_in_page/widgets/custom_text_field_widget.dart';
import 'package:authorization/presentation/common/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authorization/presentation/common/loading_overlay.dart';

part 'functions/sign_in_page_functions.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with UxNotifications, AlertDialogMixin, _HomePageStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  String emailErrorText = '';
  String passwordErrorText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(S.of(context).signInTitle),
          ),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state) {
                case AuthSuccessState state:
                  _onSuccess(state.profile);
                case AuthLoadingState _:
                  blockUI();
                case AuthErrorState state:
                  _onError(state.errorText);
                default:
                  unblockUi();
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        controller: _emailController,
                        placeholder: S.of(context).signInLoginTextLabel,
                        node: _emailNode,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      CustomTextFieldWidget(
                        obscureText: true,
                        controller: _passwordController,
                        placeholder: S.of(context).signInPasswordTextLabel,
                        node: _passwordNode,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CupertinoButton(
                        color: context.theme.primaryColor,
                        onPressed: () => _signIn(
                          email: _emailController.value.text,
                          password: _passwordController.value.text,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints.expand(height: 30),
                          child: Text(S.of(context).signInButton),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CupertinoButton(
                        color: context.theme.primaryColor,
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints.expand(height: 30),
                          child: Text(S.of(context).signUpButton),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
