import 'package:flutter/material.dart';
import 'package:potea_app/features/auth/presentation/views/auth_base_view.dart';
import 'package:potea_app/features/auth/presentation/widgets/forms/sign_up_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseView(headerTitle: 'Create Your Account', form: SignUpForm());
  }
}
