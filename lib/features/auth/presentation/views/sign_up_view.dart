import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/widgets/common/custom_divider_with_text.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_google_button.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_header.dart';
import 'package:potea/features/auth/presentation/widgets/forms/sign_up_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
              const AuthHeader(title: 'Create Your Account'),
              const Gap(26),

              // form
              SignUpForm(),

              const Gap(40),

              const CustomDividerWithText(text: "Or Continue With"),
              const Gap(30),
              const AuthGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
