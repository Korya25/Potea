import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/widgets/common/custom_button.dart';
import 'package:potea/core/widgets/fields/email_field.dart';
import 'package:potea/core/widgets/fields/password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          const Gap(16),
          PasswordField(controller: passwordController),

          const Gap(24),

          CustomButton(title: 'Sign Up', onTap: _submit),
          const Gap(16),
        ],
      ),
    );
  }
}
