import 'package:flutter/material.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/custom_social_button.dart';

class AuthGoogleButton extends StatelessWidget {
  const AuthGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSocialButton(
      onTap: () {},
      svgPath: AppAssets.google,
      title: 'Sign up with Google',
    );
  }
}
