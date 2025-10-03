import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/core/theme/app_colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          // icon
          Image.asset(AppAssets.appLogo, height: 100),

          // loading
          Lottie.asset(
            AppAssets.lottieLoading,
            width: 160,
            // color
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(const ['**'], value: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
