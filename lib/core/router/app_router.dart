import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../di/injection.dart';

// ── Domain ──────────────────────────────────────────────────────────────
import '../../domain/auth/current_user/usecases/get_current_user.dart';
import '../../domain/auth/sign_in/usecases/sign_in.dart';
import '../../domain/auth/sign_out/usecases/sign_out.dart';
import '../../domain/home/homepage/usecases/get_home_data.dart';

// ── Presentation ────────────────────────────────────────────────────────
import '../../presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import '../../presentation/auth/sign_in/pages/sign_in_page.dart';
import '../../presentation/auth/sign_out/bloc/sign_out_bloc.dart';
import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/sign-in',
  redirect: (context, state) async {
    final currentUser = await getIt<GetCurrentUser>()();
    final isLoggedIn = currentUser.isAuthenticated;
    final isOnSignIn = state.matchedLocation == '/sign-in';

    if (!isLoggedIn && !isOnSignIn) return '/sign-in';
    if (isLoggedIn && isOnSignIn) return '/home';
    return null;
  },
  routes: [
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => BlocProvider(
        create: (_) => SignInBloc(signIn: getIt<SignIn>()),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => HomeBloc(getHomeData: getIt<GetHomeData>()),
          ),
          BlocProvider(
            create: (_) => SignOutBloc(signOut: getIt<SignOut>()),
          ),
        ],
        child: const HomePage(),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri}'),
    ),
  ),
);
