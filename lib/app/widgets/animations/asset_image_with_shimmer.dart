import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AssetImageWithShimmer extends StatefulWidget {
  const AssetImageWithShimmer({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
    this.errorWidget,
    this.shimmerDuration = const Duration(milliseconds: 400),
  });

  final String assetPath;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Duration shimmerDuration;

  @override
  State<AssetImageWithShimmer> createState() => _AssetImageWithShimmerState();
}

class _AssetImageWithShimmerState extends State<AssetImageWithShimmer> {
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.shimmerDuration, () {
      if (mounted) setState(() => _showImage = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _showImage
            ? Image.asset(
                widget.assetPath,
                height: widget.height,
                width: widget.width,
                fit: widget.fit ?? BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    widget.errorWidget ??
                    const Icon(Icons.error, color: AppColors.red),
              )
            : Shimmer.fromColors(
                baseColor: AppColors.shimmerBase,
                highlightColor: AppColors.shimmerHighlight,
                child: Container(
                  color: AppColors.textAndIconPrimary,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
      ),
    );
  }
}
