import 'package:authorization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  CupertinoThemeData get theme => CupertinoTheme.of(this);

  S get s => S.of(this);
}
