import 'package:flutter/material.dart';
import 'package:potea_app/features/auth/presentation/views/auth_base_view.dart';
import 'package:potea_app/features/auth/presentation/widgets/forms/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseView(
      headerTitle: 'Login to Your Account?',
      form: LoginForm(),
    );
  }
}
