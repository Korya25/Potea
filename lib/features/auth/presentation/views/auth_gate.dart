import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/core/utils/extensions/context_extensions.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';
import 'package:potea_app/features/auth/presentation/widgets/auth_gate/auth_gate_fotter_button.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: _AuthGateBody()));
  }
}

class _AuthGateBody extends StatelessWidget {
  const _AuthGateBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // image
            SizedBox(
              height: context.screenHeight * 0.5,
              width: context.screenWidth * 0.7,
              child: Image.asset(AppAssets.group, fit: BoxFit.contain),
            ),

            Gap(8),

            // title
            Text(
              'Lets you in',
              style: context.font45PrimaryW800.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textAndIconWhite,
              ),
            ),

            Gap(context.screenHeight * 0.1),

            // Auth Gate Fotter Button
            AuthGateFotterButton(),
          ],
        ),
      ),
    );
  }
}
