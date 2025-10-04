import 'package:flutter/material.dart';
import 'package:potea/core/constants/app_assets.dart';
import 'package:potea/core/utils/context_extensions.dart';

class AuthLogoName extends StatelessWidget {
  const AuthLogoName({super.key, this.iconSize, this.titleSize});

  final double? iconSize;
  final double? titleSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // icon
        Image.asset(AppAssets.appLogo, width: iconSize ?? 80),

        // title
        Text(
          'otea',
          style: context.font16WhiteW300.copyWith(
            fontSize: titleSize ?? 45,
            //
          ),
        ),
      ],
    );
  }
}
