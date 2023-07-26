import 'package:authorization/common/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';

mixin UxNotifications<T extends StatefulWidget> on State<T> {
  OverlayEntry? entry;

  void unblockUi() {
    if (entry == null) return;
    entry!.remove();
    entry = null;
  }

  void blockUI() {
    setState(
      () {
        entry = OverlayEntry(
          builder: (context) => Container(
            width: context.width,
            height: context.height,
            color: CupertinoColors.black.withOpacity(0.8),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(entry!);
  }
}
