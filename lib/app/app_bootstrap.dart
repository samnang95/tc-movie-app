import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../core/config/env_config.dart';
import '../core/di/injection.dart';
import '../core/localization/app_locale.dart';

/// Shared bootstrap logic for all entry points.
/// Initializes environment config, DI, and locales.
Future<void> initApp(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.init(env);

  // Initialize dependency injection (get_it)
  await setupInjection();

  // Load translations from JSON
  await loadLocales();

  final localization = FlutterLocalization.instance;
  await localization.ensureInitialized();
  localization.init(
    mapLocales: appLocales,
    initLanguageCode: 'en',
  );
}
