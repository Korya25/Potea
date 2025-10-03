import 'package:flutter/material.dart';
import 'package:potea/core/animations/animate_do.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/features/splash/presentation/widgets/unessential_splash_detail.dart';

class UnessentialSplashViewBody extends StatefulWidget {
  const UnessentialSplashViewBody({super.key});

  @override
  State<UnessentialSplashViewBody> createState() =>
      _UnessentialSplashViewBodyState();
}

class _UnessentialSplashViewBodyState extends State<UnessentialSplashViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // image
        Positioned.fill(
          bottom: 0,
          child: AppAnimations.fadeInUp(
            delay: Duration(milliseconds: 50),
            Image.asset(AppAssets.secondSplash, fit: BoxFit.cover),
          ),
        ),
        // Deatil
        Positioned(bottom: 20, child: UnessentialSplashDetail()),
      ],
    );
  }
}
