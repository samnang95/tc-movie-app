import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../core/constants/app_constants.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';

class TcMovieApp extends StatelessWidget {
  const TcMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = FlutterLocalization.instance;

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      routerConfig: appRouter,
    );
  }
}
