import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';

class CarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final double activeSize;
  final double inactiveSize;
  final Duration animationDuration;
  final Color activeColor;
  final Color inactiveColor;
  final double spacing;

  const CarouselIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.activeSize = 12,
    this.inactiveSize = 8,
    this.animationDuration = const Duration(milliseconds: 300),
    this.activeColor = AppColors.textAndIconPrimary,
    this.inactiveColor = AppColors.textAndIconGrey,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: animationDuration,
          margin: EdgeInsets.symmetric(horizontal: spacing),
          width: isActive ? activeSize : inactiveSize,
          height: isActive ? activeSize : inactiveSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
