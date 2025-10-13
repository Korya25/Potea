import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/di/get_it_service.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/router/app_transitions.dart';
import 'package:potea_app/core/services/prefs/prefs_keys.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/features/auth/data/repo/auth_repo.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/views/auth_gate.dart';
import 'package:potea_app/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:potea_app/features/auth/presentation/views/login_view.dart';
import 'package:potea_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_button.dart';
import 'package:potea_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:potea_app/features/onboarding/presentation/views/splash_view.dart';
import 'package:potea_app/features/onboarding/presentation/views/unessential_splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Prefs.getBool(PrefKeys.fristTimeShowOnboarding) == true
        ? AppRoutes.splash
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

      /// Auth
      GoRoute(
        path: AppRoutes.authGate,
        name: AppRoutes.authGate,
        pageBuilder: (context, state) => AppTransitions.fade(
          context: context,
          state: state,
          child: AuthGate(),
        ),
      ),

      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(repository: getIt<AuthRepository>()),
            child: LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: AppRoutes.signup,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(repository: getIt<AuthRepository>()),
            child: SignupView(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgotPass,
        name: AppRoutes.forgotPass,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(repository: getIt<AuthRepository>()),
            child: ForgotPasswordView(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.fade(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(repository: getIt<AuthRepository>()),
            child: Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: AuthButton(
                      title: 'Logout',
                      onTap: () {
                        context.read<AuthCubit>().signOut();
                        context.goNamed(AppRoutes.authGate);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ],
  );
}
