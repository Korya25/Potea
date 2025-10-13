import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          /* context.read<AuthCubit>().signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );*/
        }
      },
      child: Text(
        'SignUp',
        style: context.font16WhiteW300.copyWith(
          color: AppColors.textAndIconWhite,
        ),
      ),
    );
  }
}
