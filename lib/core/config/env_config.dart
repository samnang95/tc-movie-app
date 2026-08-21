import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, stage, prod }

abstract class EnvConfig {
  EnvConfig._();

  static Environment _environment = Environment.dev;

  /// Initialize the environment. Call before `runApp()`.
  static Future<void> init(Environment env) async {
    _environment = env;
    await dotenv.load(fileName: '.env.${env.name}');
  }

  /// Current environment.
  static Environment get environment => _environment;

  /// The `.env.*` filename for the current environment.
  static String get envFileName => '.env.${_environment.name}';

  // ── Getters ────────────────────────────────────────────────────────
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://jsonplaceholder.typicode.com';
  static String get appName => dotenv.env['APP_NAME'] ?? 'TC-Movie';

  // ── Convenience ────────────────────────────────────────────────────
  static bool get isDev => _environment == Environment.dev;
  static bool get isStage => _environment == Environment.stage;
  static bool get isProd => _environment == Environment.prod;
}
