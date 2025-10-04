import 'package:flutter/material.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    this.prefixText,
    required this.actionText,
    this.onTap,
    this.prefixStyle,
    this.actionStyle,
    this.hoverColor,
    this.enabled = true,
  });

  final String? prefixText;
  final String actionText;
  final VoidCallback? onTap;
  final TextStyle? prefixStyle;
  final TextStyle? actionStyle;
  final Color? hoverColor;
  final bool enabled;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color baseColor =
        widget.actionStyle?.color ?? AppColors.textAndIconPrimary;
    final Color hoverColor = widget.hoverColor ?? AppColors.textAndIconGrey;

    final TextStyle prefixBaseStyle =
        widget.prefixStyle ??
        context.font14BlackW400.copyWith(color: AppColors.textAndIconWhite);

    final TextStyle actionBaseStyle =
        widget.actionStyle ??
        context.font14BlackW400.copyWith(color: baseColor);

    return MouseRegion(
      onEnter: (_) {
        if (widget.enabled) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (widget.enabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixText != null) ...[
              Text(
                widget.prefixText!,
                style: prefixBaseStyle.copyWith(
                  color: _isHovered ? hoverColor : prefixBaseStyle.color,
                ),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              widget.actionText,
              style: actionBaseStyle.copyWith(
                color: _isHovered ? hoverColor : baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
