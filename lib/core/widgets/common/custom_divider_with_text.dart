import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomDividerWithText extends StatelessWidget {
  const CustomDividerWithText({
    super.key,
    this.text = "OR",
    this.color = AppColors.darkBackgroundSecondary,
    this.textColor = AppColors.textAndIconWhite,
    this.thickness = 2,
    this.textStyle,
    this.spacing = 8,
  });

  final String text;
  final Color color;
  final Color textColor;
  final double thickness;
  final TextStyle? textStyle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: color, thickness: thickness),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Text(
            text,
            style:
                textStyle ??
                context.font14BlackW400.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Expanded(
          child: Divider(color: color, thickness: thickness),
        ),
      ],
    );
  }
}
