import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/service_locator.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../modules/home/bloc/home_cubit.dart';
import '../../modules/home/views/home_view.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (_) => HomeCubit(
          getUsersUseCase: getIt<GetUsersUseCase>(),
        ),
        child: const HomeView(),
      ),
    ),
  ],
);
