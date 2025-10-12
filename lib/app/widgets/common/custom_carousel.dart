import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:potea_app/core/utils/extensions/context_extensions.dart';

class CustomCarousel extends StatelessWidget {
  final Duration autoScrollDuration;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  final int itemCount;
  final double? height;
  final ValueChanged<int>? onPageChanged;

  const CustomCarousel({
    super.key,
    this.autoScrollDuration = const Duration(seconds: 3),
    required this.itemBuilder,
    required this.itemCount,
    this.height,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        height: height ?? context.screenHeight * 0.5,
        autoPlay: true,
        autoPlayInterval: autoScrollDuration,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 1,
        onPageChanged: (index, reason) => onPageChanged?.call(index),
      ),
    );
  }
}
