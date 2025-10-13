import 'package:flutter/material.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class AuthLogoName extends StatelessWidget {
  const AuthLogoName({super.key, this.iconSize, this.titleSize});

  final double? iconSize;
  final double? titleSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // icon
        Image.asset(AppAssets.appIcon, width: iconSize ?? 60),

        // title
        Text(
          'otea',
          style: context.font12WhiteW500.copyWith(
            fontSize: titleSize ?? 45,
            //
          ),
        ),
      ],
    );
  }
}
