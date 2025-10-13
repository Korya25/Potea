import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_text_button.dart';
import 'package:potea_app/app/widgets/fields/email_field.dart';
import 'package:potea_app/app/widgets/fields/password_field.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(controller: emailController),
          Gap(22),
          PasswordField(controller: passwordController),
          Gap(12),
          // forgt Pass
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              onTap: () => context.pushNamed(AppRoutes.forgotPass),
              fristTitle: 'Forgot Password?',
              firstColor: AppColors.textAndIconPrimary,
            ),
          ),
          Gap(24),

          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}
