import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final bool? isLoading;

  const AuthButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      buttonColor: backgroundColor ?? AppColors.primary,
      borderRadius: 10,
      child: isLoading == true
          ? CircularProgressIndicator(color: AppColors.textAndIconWhite)
          : Text(
              title,
              style: context.font22WhiteW600.copyWith(
                color: textColor ?? AppColors.textAndIconWhite,
                fontSize: fontSize ?? 18,
              ),
            ),
    );
  }
}
