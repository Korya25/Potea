import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.svgPath,
    required this.title,
    this.onTap,
    this.svgColor,
  });
  final String svgPath;
  final String title;
  final void Function()? onTap;
  final Color? svgColor;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      buttonColor: AppColors.white,
      borderRadius: 12,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8),

        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // google icon
              // ignore: deprecated_member_use
              SvgPicture.asset(svgPath, width: 26, color: svgColor),

              // title
              Text(
                title,
                style: context.font12BlackW200.copyWith(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w300,
                ),
              ),

              // Size Box
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
