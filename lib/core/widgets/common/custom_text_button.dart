import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    required this.fristTitle,
    this.secondTitle,
    this.firstColor,
    this.secondColor,
    this.fontSize = 14,
    this.fontWeight,
    this.hoverColor,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });

  final void Function()? onTap;
  final String fristTitle;
  final String? secondTitle;
  final Color? firstColor;
  final Color? secondColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? hoverColor;
  final bool enabled;
  final EdgeInsets padding;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final hoverColor = widget.hoverColor ?? AppColors.textAndIconBlack;
    final isActive = _isHovered || _isPressed;

    return MouseRegion(
      onEnter: (_) {
        if (widget.enabled) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (widget.enabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
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
        child: Padding(
          padding: widget.padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Text(
                widget.fristTitle,
                style: context.font16WhiteW300.copyWith(
                  color: isActive
                      ? hoverColor
                      : (widget.firstColor ?? AppColors.textAndIconWhite),
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
              if (widget.secondTitle != null)
                Text(
                  widget.secondTitle!,
                  style: context.font16WhiteW300.copyWith(
                    color: isActive
                        ? hoverColor
                        : (widget.secondColor ?? AppColors.textAndIconPrimary),
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
