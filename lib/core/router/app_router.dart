import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/core/router/app_routes.dart';
import 'package:potea_app/core/router/app_transitions.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    /*    
    Prefs.getBool(StorageKeys.theFristTimeStartAppOnBoarding) == true
        ? AppRoutes.splash
        : AppRoutes.unessentialSplash,
        */
    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: const Scaffold(),
        ),
      ),
    ],
  );
}
