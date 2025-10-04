import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';
import 'package:potea/core/widgets/custom_text_button.dart';
import 'package:potea/features/auth/presentation/widgets/common/custom_social_button.dart';

class AuthGateFotterButton extends StatelessWidget {
  const AuthGateFotterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: check user to suggest account aready logged in to login

        // sign up with Goolgle
        CustomSocialButton(
          onTAp: () {},
          svgPath: AppAssets.googleSvg,
          title: 'Sign up with Google',
        ),
        Gap(18),
        // sign up with email
        CustomSocialButton(
          onTAp: () {},
          svgPath: AppAssets.emailSvg,
          title: 'Sign up with Email',
          svgColor: AppColors.textAndIconBlack.withAlpha(220),
        ),

        // aready have an account
        Gap(18),
        CustomTextButton(
          prefixText: "Already have an account?",
          actionText: "Log in",
          onTap: () => print("Go to Login"),
          //  hoverColor: ,
        ),
      ],
    );
  }
}
