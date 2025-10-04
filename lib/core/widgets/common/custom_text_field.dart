import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potea/core/theme/app_colors.dart';
import 'package:potea/core/utils/context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.inputFormatters,
    this.filled = true,
    this.fillColor = AppColors.darkBackgroundSecondary,
    this.textInputAction,
    this.autofillHints,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  });

  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final Color fillColor;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    );

    return TextFormField(
      controller: controller,
      autofillHints: autofillHints,
      autovalidateMode: autoValidateMode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      inputFormatters: inputFormatters,
      style: context.font14BlackW400.copyWith(
        color: AppColors.textAndIconWhite,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.font14BlackW400.copyWith(
          color: AppColors.textAndIconGrey,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: AppColors.textAndIconPrimary,
        suffixIconColor: AppColors.textAndIconWhite,
        filled: filled,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}
