import 'package:authorization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class AppSettings {
  static const List<LocalizationsDelegate> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static List<Locale> supportedLocales = S.delegate.supportedLocales;
}
