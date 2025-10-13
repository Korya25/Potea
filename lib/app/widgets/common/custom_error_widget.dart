import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    this.onTapReport,
    this.onTapRetry,
    this.maxLine,
  });

  final String errorMessage;
  final void Function()? onTapRetry;
  final void Function()? onTapReport;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 22,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: context.font16PrimaryW400.copyWith(color: AppColors.red),
            textAlign: TextAlign.center,
            maxLines: maxLine ?? 3,
          ),
          if (onTapRetry != null)
            CustomButton(onTap: onTapRetry, title: 'Retry'),

          if (onTapReport != null)
            CustomButton(
              title: 'Send Report',
              onTap: onTapReport,
              buttonColor: AppColors.textAndIconGrey,

              fontSize: 18,
            ),
        ],
      ),
    );
  }
}
