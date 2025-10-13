import 'package:flutter/material.dart';
import 'package:potea_app/app/widgets/common/custom_text_field.dart';
import 'package:potea_app/core/utils/extensions/validators.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "Enter your full name",
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      prefixIcon: const Icon(Icons.person_outline),
      validator: Validators.name,
    );
  }
}
