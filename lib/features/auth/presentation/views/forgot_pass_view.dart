import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_header.dart';
import 'package:potea/features/auth/presentation/widgets/forms/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpaces.ph16,
          child: Column(
            children: [
              AppBar(),
              const Gap(40),

              // header
              const AuthHeader(title: 'Forgot Your Password?'),
              const Gap(26),

              // form
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
