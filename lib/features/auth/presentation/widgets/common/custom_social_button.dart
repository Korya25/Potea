import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';
import 'package:potea/core/widgets/custom_button.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.svgPath,
    required this.title,
    this.onTAp,
    this.svgColor,
  });
  final String svgPath;
  final String title;
  final void Function()? onTAp;
  final Color? svgColor;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTAp,
      hight: 50,
      buttonColor: AppColors.white,
      borderRadius: 12,
      child: Padding(
        padding: AppSpaces.pv8,

        child: Padding(
          padding: AppSpaces.ph12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // google icon
              // ignore: deprecated_member_use
              SvgPicture.asset(svgPath, width: 30, color: svgColor),

              // title
              Text(
                title,
                style: context.font14BlackW400.copyWith(
                  fontSize: 18,
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
