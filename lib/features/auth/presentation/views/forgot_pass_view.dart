import 'package:flutter/material.dart';
import 'package:potea_app/features/auth/presentation/views/auth_base_view.dart';
import 'package:potea_app/features/auth/presentation/widgets/forms/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseView(
      headerTitle: 'Forgot Your Password?',
      form: ForgotPasswordForm(),
      showSocialLogin: false,
    );
  }
}
