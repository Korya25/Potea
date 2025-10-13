import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_header.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_google_button.dart';

class AuthBaseView extends StatelessWidget {
  final String headerTitle;
  final Widget form;
  final bool showSocialLogin;

  const AuthBaseView({
    super.key,
    required this.headerTitle,
    required this.form,
    this.showSocialLogin = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(),
              const Gap(22),
              AuthHeader(title: headerTitle),
              const Gap(34),
              form,
              if (showSocialLogin) ...[const Gap(50), const AuthGoogleButton()],
            ],
          ),
        ),
      ),
    );
  }
}
