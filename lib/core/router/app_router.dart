import 'package:go_router/go_router.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/core/router/app_transitions.dart';
import 'package:potea/core/services/shared/pref_keys.dart';
import 'package:potea/core/services/shared/shared_preferences_singleton.dart';
import 'package:potea/features/auth/presentation/views/auth_gate.dart';
import 'package:potea/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:potea/features/auth/presentation/views/login_view.dart';
import 'package:potea/features/auth/presentation/views/sign_up_view.dart';
import 'package:potea/features/splash/presentation/views/splash_view.dart';
import 'package:potea/features/splash/presentation/views/unessential_splash_view.dart';
import 'package:potea/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:potea/features/home/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Prefs.getBool(PrefKeys.theFristTimeStartApp) == true
        ? AppRoutes.unessentialSplash
        : AppRoutes.unessentialSplash,
    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => AppTransitions.fade(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      // Unessential Splash
      GoRoute(
        path: AppRoutes.unessentialSplash,
        name: AppRoutes.unessentialSplash,
        pageBuilder: (context, state) => AppTransitions.fade(
          context: context,
          state: state,
          child: const UnessentialSplashView(),
        ),
      ),
      // Onboarding
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const OnboardingView(),
        ),
      ),
      // Auth Gate
      GoRoute(
        path: AppRoutes.authGate,
        name: AppRoutes.authGate,
        pageBuilder: (context, state) => AppTransitions.fadeScale(
          context: context,
          state: state,
          child: const AuthGate(),
        ),
      ),
      // Login
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const LoginView(),
        ),
      ),
      // Signup
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const SignupView(),
        ),
      ),
      // Forgot Password
      GoRoute(
        path: AppRoutes.forgotPass,
        name: AppRoutes.forgotPass,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const ForgotPasswordView(),
        ),
      ),
      // Home
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.slideAndFade(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
    ],
  );
}
