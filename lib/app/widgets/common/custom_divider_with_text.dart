import 'package:flutter/material.dart';

import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class CustomDividerWithText extends StatelessWidget {
  const CustomDividerWithText({
    super.key,
    this.text,
    this.color = AppColors.dBackSecondary,
    this.textColor = AppColors.textAndIconWhite,
    this.thickness = 2,
    this.spacing = 8,
    this.textStyle,
  });

  final String? text;
  final Color color;
  final Color textColor;
  final double thickness;
  final double spacing;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: color, thickness: thickness),
        ),
        if (text != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Text(
              text!,
              style:
                  textStyle ??
                  context.font14GreyW400.copyWith(color: textColor),
            ),
          ),
        Expanded(
          child: Divider(color: color, thickness: thickness),
        ),
      ],
    );
  }
}
