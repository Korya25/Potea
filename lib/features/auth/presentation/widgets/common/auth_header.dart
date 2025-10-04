import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/utils/context_extensions.dart';
import 'package:potea/features/auth/presentation/widgets/common/auth_logo_name.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthLogoName(),
        Gap(26),

        // title
        Text(title, style: context.font16WhiteW300.copyWith(fontSize: 24)),
      ],
    );
  }
}
