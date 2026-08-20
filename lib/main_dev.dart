import 'package:flutter/material.dart';

import 'app/app_bootstrap.dart';
import 'core/config/env_config.dart';
import 'app/tc_movie_app.dart';

Future<void> main() async {
  await initApp(Environment.dev);
  runApp(const TcMovieApp());
}
