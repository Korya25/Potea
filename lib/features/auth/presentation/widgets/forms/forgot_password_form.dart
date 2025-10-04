import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:potea/core/widgets/common/custom_button.dart';
import 'package:potea/core/widgets/fields/email_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (formKey.currentState?.validate() ?? false) {
      debugPrint("email: ${emailController.text}");
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
          const Gap(24),

          CustomButton(title: 'Send Reset Link', onTap: _submit),
        ],
      ),
    );
  }
}
