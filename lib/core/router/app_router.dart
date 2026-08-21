import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../di/injection.dart';

// ── Domain ──────────────────────────────────────────────────────────────
import '../../domain/auth/current_user/usecases/get_current_user.dart';
import '../../domain/auth/sign_in/usecases/sign_in.dart';
import '../../domain/auth/sign_out/usecases/sign_out.dart';
import '../../domain/auth/sign_up/usecases/sign_up.dart';
import '../../domain/auth/forgot_password/usecases/forgot_password.dart';
import '../../domain/home/homepage/usecases/get_home_data.dart';

// ── Presentation ────────────────────────────────────────────────────────
import '../../presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import '../../presentation/auth/sign_in/pages/sign_in_page.dart';
import '../../presentation/auth/sign_out/bloc/sign_out_bloc.dart';
import '../../presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import '../../presentation/auth/sign_up/pages/sign_up_page.dart';
import '../../presentation/auth/forgot_password/bloc/forgot_password_bloc.dart';
import '../../presentation/auth/forgot_password/pages/forgot_password_page.dart';
import '../../presentation/dashboard/pages/dashboard_page.dart';
import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/pages/home_page.dart';
import '../../presentation/search/pages/search_page.dart';
import '../../presentation/my_list/pages/my_list_page.dart';
import '../../presentation/profile/pages/profile_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/sign-in',
  redirect: (context, state) async {
    final currentUser = await getIt<GetCurrentUser>()();
    final isLoggedIn = currentUser.isAuthenticated;
    final isOnSignIn = state.matchedLocation == '/sign-in';
    final isOnSignUp = state.matchedLocation == '/sign-up';
    final isOnForgotPassword = state.matchedLocation == '/forgot-password';

    if (!isLoggedIn && !isOnSignIn && !isOnSignUp && !isOnForgotPassword) return '/sign-in';
    if (isLoggedIn && (isOnSignIn || isOnSignUp || isOnForgotPassword)) return '/home';
    return null;
  },
  routes: [
    GoRoute(
      path: '/sign-in',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (_) => SignInBloc(signIn: getIt<SignIn>()),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: '/sign-up',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (_) => SignUpBloc(signUp: getIt<SignUp>()),
        child: const SignUpPage(),
      ),
    ),
    GoRoute(
      path: '/forgot-password',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (_) => ForgotPasswordBloc(forgotPassword: getIt<ForgotPassword>()),
        child: const ForgotPasswordPage(),
      ),
    ),

    // ── Dashboard (StatefulShellRoute) ────────────────────────────────────
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        // Tab 0: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => HomeBloc(getHomeData: getIt<GetHomeData>()),
                  ),
                ],
                child: const HomePage(),
              ),
            ),
          ],
        ),
        // Tab 1: Search
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchPage(),
            ),
          ],
        ),
        // Tab 2: My List
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my-list',
              builder: (context, state) => const MyListPage(),
            ),
          ],
        ),
        // Tab 3: Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => BlocProvider(
                create: (_) => SignOutBloc(signOut: getIt<SignOut>()),
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri}'),
    ),
  ),
);
