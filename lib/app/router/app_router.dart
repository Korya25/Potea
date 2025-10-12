import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/router/app_transitions.dart';
import 'package:potea_app/features/onboarding/presentation/views/splash_view.dart';
import 'package:potea_app/features/onboarding/presentation/views/unessential_splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.unessentialSplash,
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
    ],
  );
}
