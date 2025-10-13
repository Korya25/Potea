import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';
import 'package:potea_app/features/auth/presentation/widgets/common/auth_logo_name.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthLogoName(),
        Gap(40),
        // title
        Text(title, style: context.font12WhiteW500.copyWith(fontSize: 24)),
      ],
    );
  }
}
