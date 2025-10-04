import 'package:flutter/material.dart';
import 'package:potea/core/utils/validators.dart';
import 'package:potea/core/widgets/common/custom_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "Enter your email",
      keyboardType: TextInputType.emailAddress,
      validator: Validators.email,
      autofillHints: const [AutofillHints.email],
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }
}
