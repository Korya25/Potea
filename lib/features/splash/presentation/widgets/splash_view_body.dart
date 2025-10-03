import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:potea/core/animations/animate_do.dart';
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
          AppAnimations.bounceIn(
            delay: Duration(milliseconds: 250),
            Image.asset(AppAssets.appLogo, width: 150),
          ),

          // loading
          AppAnimations.bounceInUp(
            delay: Duration(milliseconds: 350),
            Lottie.asset(
              AppAssets.lottieLoading,
              width: 130,
              // color
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(const ['**'], value: AppColors.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
