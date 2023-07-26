part of '../sign_in_page.dart';

extension _SignInPageExtenstion on _SignInPageState {
  bool passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      _update(() {
        passwordErrorText = S.of(context).tooSmallPasswordError;
      });
      return false;
    } else {
      _update(() {
        passwordErrorText = '';
      });
      return true;
    }
  }

  bool emailValidator(String? value) {
    RegExp emailValidator =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.");
    if (value == null || value.isEmpty || !emailValidator.hasMatch(value)) {
      _update(() {
        emailErrorText = S.of(context).incorrectEmailError;
      });
      return false;
    } else {
      _update(() {
        emailErrorText = '';
      });
      return true;
    }
  }

  void _onSuccess(Profile profile) {
    unblockUi();
    Navigator.of(context)
        .pushReplacementNamed(AppRoutes.home, arguments: {'profile': profile});
  }

  void _signIn({
    required String email,
    required String password,
  }) {
    FocusScope.of(context).unfocus();
    bool emailCorrect = emailValidator(email.trim());
    bool passwordCorrect = passwordValidator(password.trim());
    if (emailCorrect && passwordCorrect) {
      context.read<AuthBloc>().add(
            AuthSignInEvent(
              email: _emailController.value.text,
              password: _passwordController.value.text,
            ),
          );
    } else {
      String content = '';
      if (emailErrorText.isNotEmpty) {
        content += emailErrorText;
      }
      if (passwordErrorText.isNotEmpty) {
        content += '\n$passwordErrorText';
      }
      showAlert(
        content: content,
        title: S.of(context).checkDataCorrectionErrorTitle,
      );
    }
  }

  void _onError(String errorText) {
    unblockUi();
    showAlert(
      title: S.of(context).checkDataCorrectionErrorTitle,
      content: S.of(context).checkDataCorrectionErrorExplanation,
    );
  }
}

mixin _HomePageStateMixin<T extends StatefulWidget> on State<T> {
  void _update(VoidCallback toUpdate) => setState(() => toUpdate());
}
