import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const HorizontalListView({
    super.key,
    required this.height,
    required this.itemBuilder,
    this.padding,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: padding,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
