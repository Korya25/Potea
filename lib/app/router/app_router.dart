import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/router/app_transitions.dart';
import 'package:potea_app/core/services/prefs/prefs_keys.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:potea_app/features/onboarding/presentation/views/splash_view.dart';
import 'package:potea_app/features/onboarding/presentation/views/unessential_splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Prefs.getBool(PrefKeys.fristTimeShowOnboarding) == true
        ? AppRoutes
              .unessentialSplash // splash
        : AppRoutes.unessentialSplash,

    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.unessentialSplash,
        name: AppRoutes.unessentialSplash,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: UnessentialSplashView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: OnboardingView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.authGate,
        name: AppRoutes.authGate,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('Auth Gate')),
          ),
        ),
      ),
    ],
  );
}
