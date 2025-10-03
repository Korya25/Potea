import 'package:flutter/material.dart';
import 'package:potea/core/animations/animate_do.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/utils/context_extensions.dart';
import 'package:potea/features/onboarding/data/onboarding_items_model.dart';

class OnboardingItems extends StatelessWidget {
  const OnboardingItems({super.key, required this.itemsModel});
  final OnboardingItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpaces.ph16,
      child: Center(
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
                child: AppAnimations.bounceIn(
                  delay: Duration(milliseconds: 350),
                  Image.asset(itemsModel.imagePath),
                ),
              ),
            ),

            AppAnimations.fadeIn(
              delay: Duration(milliseconds: 400),

              Text(
                itemsModel.title,
                style: context.bodyLarge.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
