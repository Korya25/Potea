import 'package:flutter/material.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/features/auth/presentation/widgets/common/custom_social_button.dart';

class AuthGoogleButton extends StatelessWidget {
  const AuthGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSocialButton(
      onTap: () {},
      svgPath: AppAssets.googleSvg,
      title: 'Sign up with Google',
    );
  }
}
