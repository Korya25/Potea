import 'package:flutter/material.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/core/utils/extensions/context_extensions.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';
import 'package:potea_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingItems extends StatelessWidget {
  const OnboardingItems({super.key, required this.itemsModel});
  final OnboardingModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: context.screenHeight * 0.4,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.98, 1.0],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: AppAnimations.bounceInDown(
                    delay: Duration(milliseconds: 350),
                    Image.asset(itemsModel.imagePath),
                  ),
                ),
              ),
            ),

            AppAnimations.fadeIn(
              delay: Duration(milliseconds: 400),
              Text(
                itemsModel.title,
                style: context.font22WhiteW600.copyWith(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
