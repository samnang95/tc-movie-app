import 'package:get_it/get_it.dart';

import '../../data/local/local_storage_service.dart';
import '../../data/providers/auth_provider.dart';
import '../../data/providers/user_provider.dart';
import '../../data/repositories/user_repository.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../../domain/usecases/get_user_by_id_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../network/api_client.dart';
import '../services/auth_service.dart';

final getIt = GetIt.instance;

/// Initialise all dependencies.
/// Must be called during app bootstrap before `runApp()`.
Future<void> setupServiceLocator() async {
  // ── Local storage (async init) ──────────────────────────────────────
  final localStorage = LocalStorageService();
  await localStorage.init();
  getIt.registerSingleton<LocalStorageService>(localStorage);

  // ── Auth ─────────────────────────────────────────────────────────────
  final authProvider = AuthProvider();
  getIt.registerSingleton<AuthProvider>(authProvider);

  getIt.registerSingleton<AuthService>(
    AuthService(authProvider: authProvider, storage: localStorage),
  );

  // ── Network ──────────────────────────────────────────────────────────
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // ── Providers ────────────────────────────────────────────────────────
  getIt.registerLazySingleton<UserProvider>(
    () => UserProvider(getIt<ApiClient>()),
  );

  // ── Repositories ─────────────────────────────────────────────────────
  getIt.registerLazySingleton<UserRepositoryInterface>(
    () => UserRepository(getIt<UserProvider>()),
  );

  // ── Use cases ────────────────────────────────────────────────────────
  getIt.registerLazySingleton(
    () => GetUsersUseCase(getIt<UserRepositoryInterface>()),
  );
  getIt.registerLazySingleton(
    () => GetUserByIdUseCase(getIt<UserRepositoryInterface>()),
  );
}
