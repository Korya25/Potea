import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:potea/core/animations/animate_do.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/utils/context_extensions.dart';
import 'package:potea/features/auth/presentation/widgets/auth_gate/auth_gate_fotter_button.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _AuthGateBody())),
    );
  }
}

class _AuthGateBody extends StatelessWidget {
  const _AuthGateBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpaces.ph16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // image
            AppAnimations.fadeIn(
              delay: Duration(milliseconds: 350),
              SizedBox(
                height: context.screenHeight * 0.5,
                width: context.screenWidth * 0.7,
                child: Image.asset(
                  AppAssets.authGateGroup,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Gap(8),

            // title
            Text(
              'Lets you in',
              style: context.font16WhiteW300.copyWith(fontSize: 42),
            ),

            Gap(context.screenHeight * 0.1),

            // Auth Gate Fotter Button
            AuthGateFotterButton(),

            /*
  AppAnimations.bounceIn(
              AuthGateFotterButton(),
              delay: Duration(milliseconds: 600),
            ),
            */
          ],
        ),
      ),
    );
  }
}
