import 'package:authorization/common/app_routes/app_routes.dart';
import 'package:authorization/common/app_settings/app_settings.dart';
import 'package:authorization/common/app_style/app_theme.dart';
import 'package:flutter/cupertino.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: AppSettings.localizationsDelegates,
      supportedLocales: AppSettings.supportedLocales,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
