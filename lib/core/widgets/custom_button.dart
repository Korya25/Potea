import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.child,
    this.hight,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
  });
  final void Function()? onTap;
  final String? title;
  final Widget? child;
  final double? hight;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hight ?? 45,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.primary,
        ),
        child: Center(
          child:
              child ??
              Text(
                title ?? 'Add Title',
                style: context.bodyLarge.copyWith(
                  color: fontColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
        ),
      ),
    );
  }
}
