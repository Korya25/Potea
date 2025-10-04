import 'package:flutter/material.dart';
import 'package:potea/core/animations/animate_do.dart';
import 'package:potea/core/animations/type_writer_text.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class UnessentialSplashDetail extends StatelessWidget {
  const UnessentialSplashDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpaces.p24,
      child: AppAnimations.fadeInLeft(
        delay: Duration(seconds: 1),
        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcom to 👋',
              style: context.font16WhiteW300.copyWith(fontSize: 28),
            ),
            TypeWriterText(
              text: 'Potea',
              textStyle: context.font16WhiteW300.copyWith(
                fontSize: 60,
                color: AppColors.textAndIconPrimary,
              ),
              cursorColor: AppColors.textAndIconPrimary,
              charDuration: Duration(milliseconds: 300),
              initialDelay: Duration(milliseconds: 1200),
            ),
            Text(
              'The best plant e-commerce & online store\napp of the century for tour needs!',
              style: context.font16WhiteW300.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
