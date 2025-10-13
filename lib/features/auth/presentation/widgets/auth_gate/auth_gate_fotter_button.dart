import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/app/widgets/common/custom_text_button.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_google_button.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/custom_social_button.dart';

class AuthGateFotterButton extends StatelessWidget {
  const AuthGateFotterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // sign up with Goolgle
        AppAnimations.fadeInUp(
          delay: Duration(milliseconds: 600),

          AuthGoogleButton(),
        ),
        Gap(18),
        // sign up with email
        AppAnimations.fadeInUp(
          delay: Duration(milliseconds: 900),
          CustomSocialButton(
            onTap: () => context.pushNamed(AppRoutes.signup),
            svgPath: AppAssets.email,
            title: 'Sign up with Email',
            svgColor: AppColors.textAndIconWhite,
          ),
        ),

        // aready have an account
        Gap(18),
        AppAnimations.fadeInUp(
          delay: Duration(milliseconds: 1200),

          CustomTextButton(
            fristTitle: "Already have account?",
            secondTitle: "Log in",
            fontWeight: FontWeight.w400,
            onTap: () => context.pushNamed(AppRoutes.login),
          ),
        ),
      ],
    );
  }
}
