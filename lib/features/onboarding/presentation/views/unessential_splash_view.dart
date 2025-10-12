import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/app/widgets/animations/type_writer_text.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class UnessentialSplashView extends StatefulWidget {
  const UnessentialSplashView({super.key});

  @override
  State<UnessentialSplashView> createState() => _UnessentialSplashViewState();
}

class _UnessentialSplashViewState extends State<UnessentialSplashView> {
  @override
  void initState() {
    super.initState();
    // navigat
    Future.delayed(Duration(milliseconds: 4200), () {
      if (mounted) {
        context.goNamed(AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Positioned(
            bottom: 50,
            left: 20,
            child: AppAnimations.fadeInLeft(
              delay: Duration(seconds: 1),
              Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcom to 👋',
                    style: context.font12WhiteW500.copyWith(fontSize: 28),
                  ),
                  TypeWriterText(
                    text: 'Potea',
                    textStyle: context.font45PrimaryW800.copyWith(fontSize: 57),
                    cursorColor: AppColors.textAndIconPrimary,
                    charDuration: Duration(milliseconds: 300),
                    initialDelay: Duration(milliseconds: 1200),
                  ),
                  Text(
                    'The best plant e-commerce & online store\napp of the century for tour needs!',
                    style: context.font12WhiteW500.copyWith(fontSize: 14),
                  ),
                  //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
