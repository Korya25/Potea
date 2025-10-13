import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/widgets/fields/email_field.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(controller: emailController),
          const Gap(24),

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthPasswordResetEmailSent) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password reset email sent')),
                );
                context.pop();
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return AuthButton(
                isLoading: isLoading,
                title: 'Send Reset Link',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().sendPasswordResetEmail(
                      email: emailController.text.trim(),
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
