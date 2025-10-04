import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/widgets/common/custom_text_button.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_google_button.dart';
import 'package:potea/features/auth/presentation/widgets/common/custom_social_button.dart';

class AuthGateFotterButton extends StatelessWidget {
  const AuthGateFotterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: check user to suggest account aready logged in to login

        // sign up with Goolgle
        AuthGoogleButton(),
        Gap(18),
        // sign up with email
        CustomSocialButton(
          onTap: () => context.pushNamed(AppRoutes.signUp),
          svgPath: AppAssets.emailSvg,
          title: 'Sign up with Email',
          svgColor: AppColors.textAndIconBlack.withAlpha(220),
        ),

        // aready have an account
        Gap(18),
        CustomTextButton(
          fristTitle: "Already have account?",
          secondTitle: "Log in",
          onTap: () => context.pushNamed(AppRoutes.login),
        ),
      ],
    );
  }
}
