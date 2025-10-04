// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.child,
    this.hight,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.buttonColor,
    this.hoverColor,
    this.borderRadius,
    this.enabled = true,
  });

  final void Function()? onTap;
  final String? title;
  final Widget? child;
  final double? hight;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? buttonColor;
  final Color? hoverColor;
  final double? borderRadius;
  final bool enabled;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.buttonColor ?? AppColors.primary;
    final hoverColor = widget.hoverColor ?? baseColor.withOpacity(0.8);

    // decide color based on state
    Color backgroundColor;
    if (!widget.enabled) {
      backgroundColor = Colors.grey.shade400; // disabled
    } else if (_isPressed) {
      backgroundColor = hoverColor.withOpacity(0.6); // pressed
    } else if (_isHovered) {
      backgroundColor = hoverColor; // hover
    } else {
      backgroundColor = baseColor; // normal
    }

    return MouseRegion(
      onEnter: (_) {
        if (widget.enabled) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (widget.enabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTapDown: (_) {
          if (widget.enabled) setState(() => _isPressed = true);
        },
        onTapUp: (_) {
          if (widget.enabled) setState(() => _isPressed = false);
        },
        onTapCancel: () {
          if (widget.enabled) setState(() => _isPressed = false);
        },
        onTap: widget.enabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: widget.hight ?? 45,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
            color: backgroundColor,
          ),
          child: Center(
            child:
                widget.child ??
                Text(
                  widget.title ?? 'Add Title',
                  style: context.font16WhiteW300.copyWith(
                    color: widget.fontColor ?? Colors.white,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
