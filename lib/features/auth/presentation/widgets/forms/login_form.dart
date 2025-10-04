import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/widgets/common/custom_button.dart';
import 'package:potea/core/widgets/common/custom_text_button.dart';
import 'package:potea/core/widgets/fields/email_field.dart';
import 'package:potea/core/widgets/fields/password_field.dart';

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

  void _submit() {
    if (formKey.currentState?.validate() ?? false) {
      debugPrint("Email: ${emailController.text}");
      debugPrint("Password: ${passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(controller: emailController),
          Gap(16),
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

          CustomButton(title: 'Login', onTap: _submit),
        ],
      ),
    );
  }
}
