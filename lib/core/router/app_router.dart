import 'package:go_router/go_router.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/core/router/app_transitions.dart';
import 'package:potea/core/services/shared/pref_keys.dart';
import 'package:potea/core/services/shared/shared_preferences_singleton.dart';
import 'package:potea/features/splash/presentation/views/splash_view.dart';
import 'package:potea/features/splash/presentation/views/unessential_splash_view.dart';
import 'package:potea/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:potea/features/home/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Prefs.getBool(PrefKeys.theFristTimeStartApp) == true
        ? AppRoutes.splash
        : AppRoutes.unessentialSplash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.unessentialSplash,
        name: AppRoutes.unessentialSplash,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: const UnessentialSplashView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: const OnboardingView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.noTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
    ],
  );
}
