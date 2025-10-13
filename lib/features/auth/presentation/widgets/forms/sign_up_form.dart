import 'package:flutter/material.dart';
import 'package:potea_app/app/widgets/fields/email_field.dart';
import 'package:potea_app/app/widgets/fields/password_field.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(controller: emailController),
          const SizedBox(height: 22),
          PasswordField(controller: passwordController),
          const SizedBox(height: 24),
          AuthButton(title: 'Sign Up', onTap: () {}),
        ],
      ),
    );
  }
}
