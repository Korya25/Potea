import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/widgets/fields/email_field.dart';
import 'package:potea_app/app/widgets/fields/name_field.dart';
import 'package:potea_app/app/widgets/fields/password_field.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';
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
  final TextEditingController nameController = TextEditingController();

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
          NameField(controller: nameController),
          const SizedBox(height: 22),
          EmailField(controller: emailController),
          const SizedBox(height: 22),
          PasswordField(controller: passwordController),
          const SizedBox(height: 24),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                // Navigate to home
                context.go(AppRoutes.home);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return AuthButton(
                title: 'Sign up',
                isLoading: isLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: nameController.text.trim(),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
