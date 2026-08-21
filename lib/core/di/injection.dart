import 'package:get_it/get_it.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/preferences.dart';
import '../../core/storage/secure_storage.dart';

// ── Data: Auth ──────────────────────────────────────────────────────────
import '../../data/auth/current_user/datasources/current_user_local_datasource.dart';
import '../../data/auth/current_user/repositories/current_user_repository_impl.dart';
import '../../data/auth/refresh_token/datasources/refresh_token_remote_datasource.dart';
import '../../data/auth/refresh_token/repositories/refresh_token_repository_impl.dart';
import '../../data/auth/sign_in/datasources/sign_in_remote_datasource.dart';
import '../../data/auth/sign_in/repositories/sign_in_repository_impl.dart';
import '../../data/auth/sign_out/datasources/sign_out_local_datasource.dart';
import '../../data/auth/sign_out/repositories/sign_out_repository_impl.dart';
import '../../data/auth/sign_up/datasources/sign_up_remote_datasource.dart';
import '../../data/auth/sign_up/repositories/sign_up_repository_impl.dart';

// ── Data: Home ──────────────────────────────────────────────────────────
import '../../data/home/datasources/home_remote_datasource.dart';
import '../../data/home/repositories/home_repository_impl.dart';

// ── Domain: Auth ────────────────────────────────────────────────────────
import '../../domain/auth/current_user/repositories/current_user_repository.dart';
import '../../domain/auth/current_user/usecases/get_current_user.dart';
import '../../domain/auth/refresh_token/repositories/refresh_token_repository.dart';
import '../../domain/auth/refresh_token/usecases/refresh_token.dart';
import '../../domain/auth/sign_in/repositories/sign_in_repository.dart';
import '../../domain/auth/sign_in/usecases/sign_in.dart';
import '../../domain/auth/sign_out/repositories/sign_out_repository.dart';
import '../../domain/auth/sign_out/usecases/sign_out.dart';
import '../../domain/auth/sign_up/repositories/sign_up_repository.dart';
import '../../domain/auth/sign_up/usecases/sign_up.dart';

// ── Domain: Home ────────────────────────────────────────────────────────
import '../../domain/home/homepage/repositories/home_repository.dart';
import '../../domain/home/homepage/usecases/get_home_data.dart';

final getIt = GetIt.instance;

/// Initialise all dependencies.
/// Must be called during app bootstrap before `runApp()`.
Future<void> setupInjection() async {
  // ── Core ──────────────────────────────────────────────────────────────

  // Preferences (async init)
  final preferences = Preferences();
  await preferences.init();
  getIt.registerSingleton<Preferences>(preferences);

  // Secure Storage
  getIt.registerSingleton<SecureStorage>(SecureStorage());

  // API Client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // ── Data Sources ──────────────────────────────────────────────────────
  getIt.registerLazySingleton<SignInRemoteDataSource>(() => SignInRemoteDataSource(getIt<ApiClient>()));
  getIt.registerLazySingleton<SignOutLocalDataSource>(() => SignOutLocalDataSource(getIt<SecureStorage>()));
  getIt.registerLazySingleton<CurrentUserLocalDataSource>(() => CurrentUserLocalDataSource(getIt<SecureStorage>()));
  getIt.registerLazySingleton<RefreshTokenRemoteDataSource>(() => RefreshTokenRemoteDataSource(getIt<SecureStorage>()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(getIt<ApiClient>()));
  getIt.registerLazySingleton<SignUpRemoteDataSource>(() => SignUpRemoteDataSource(getIt<ApiClient>()));

  // ── Repositories ──────────────────────────────────────────────────────
  getIt.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl(getIt<SignInRemoteDataSource>(), getIt<SecureStorage>()));
  getIt.registerLazySingleton<SignOutRepository>(() => SignOutRepositoryImpl(getIt<SignOutLocalDataSource>()));
  getIt.registerLazySingleton<CurrentUserRepository>(() => CurrentUserRepositoryImpl(getIt<CurrentUserLocalDataSource>()));
  getIt.registerLazySingleton<RefreshTokenRepository>(() => RefreshTokenRepositoryImpl(getIt<RefreshTokenRemoteDataSource>()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()));
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(getIt<SignUpRemoteDataSource>(), getIt<SecureStorage>()));

  // ── Use Cases ─────────────────────────────────────────────────────────
  getIt.registerLazySingleton(() => SignIn(getIt<SignInRepository>()));
  getIt.registerLazySingleton(() => SignOut(getIt<SignOutRepository>()));
  getIt.registerLazySingleton(() => GetCurrentUser(getIt<CurrentUserRepository>()));
  getIt.registerLazySingleton(() => RefreshToken(getIt<RefreshTokenRepository>()));
  getIt.registerLazySingleton(() => GetHomeData(getIt<HomeRepository>()));
  getIt.registerLazySingleton(() => SignUp(getIt<SignUpRepository>()));
}
