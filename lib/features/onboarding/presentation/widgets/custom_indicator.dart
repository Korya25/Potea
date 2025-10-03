import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.totalPages,
    required this.currentIndex,
  });
  final int totalPages;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 40 : 12,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : AppColors.textAndIconGrey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
