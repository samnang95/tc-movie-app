import '../config/env_config.dart';

abstract class AppConstants {
  AppConstants._();

  static String get appName => EnvConfig.appName;

  // API
  static String get baseUrl => EnvConfig.baseUrl;
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
