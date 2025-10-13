import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea_app/app/widgets/common/custom_divider_with_text.dart';
import 'package:potea_app/core/constants/hero_tags.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_google_button.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_header.dart';
import 'package:potea_app/features/auth/presentation/widgets/forms/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              // app bar
              AppBar(),
              Gap(40),

              // app logoName
              Hero(
                tag: HeroTags.loginForgotPassHeader,
                child: AuthHeader(title: 'Login to Your Account?'),
              ),
              Gap(26),

              // login form
              LoginForm(),

              Gap(50),

              // Social
              const CustomDividerWithText(text: "Or Continue With"),
              Gap(30),
              AuthGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
