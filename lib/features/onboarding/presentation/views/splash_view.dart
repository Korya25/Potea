// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:potea_app/app/di/get_it_service.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final cubit = getIt<AuthCubit>();

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 3));

    await cubit.refreshUserData();
    final state = cubit.state;

    if (state is AuthAuthenticated) {
      context.goNamed(AppRoutes.home);
    } else {
      context.goNamed(AppRoutes.authGate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),

            AppAnimations.fadeIn(
              delay: const Duration(milliseconds: 600),
              Image.asset(AppAssets.appIcon, width: 110),
            ),

            Column(
              children: [
                Lottie.asset(
                  AppAssets.trailLoading,
                  width: 130,
                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.color(const [
                        '**',
                      ], value: AppColors.primary),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    'Please wait...',
                    style: context.font14PrimaryW600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
