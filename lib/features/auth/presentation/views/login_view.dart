import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_header.dart';
import 'package:potea/features/auth/presentation/widgets/forms/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // app bar
            AppBar(),
            Gap(40),

            // app logoName
            AuthHeader(title: 'Login to Your Account?'),
            Gap(26),

            // login form
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
