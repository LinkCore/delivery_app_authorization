import 'package:authorization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

mixin AlertDialogMixin<T extends StatefulWidget> on State<T> {
  void showAlert({required String content, required String title}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Column(
            children: [
              Text(content),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(S.of(context).alertDialogAllowButton),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
