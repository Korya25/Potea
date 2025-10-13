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
      hight: 55,
      onTap: onTap,
      buttonColor: AppColors.dBackSecondary,
      borderRadius: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // google icon
          // ignore: deprecated_member_use
          SvgPicture.asset(
            svgPath,
            width: 26,
            colorFilter: svgColor != null
                ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
                : null,
          ),

          // title
          Text(
            title,
            style: context.font12WhiteW500.copyWith(
              fontSize: 16,

              fontWeight: FontWeight.w500,
            ),
          ),

          // Size Box
          SizedBox(),
        ],
      ),
    );
  }
}
