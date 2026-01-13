import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';
import 'app_icons.dart';

/// =====================
/// TextField 입력 장식(InputDecoration) 정의
/// =====================
class AppInputDecorations {
  // Private constructor to prevent instantiation
  AppInputDecorations._();

  // 기본 스타일
  static InputDecoration standard({
    String? hintText,
    String? errorText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.hint,
      errorText: errorText,
      errorStyle: AppTextStyles.error,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.focusBorder),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      suffixIcon: suffixIcon,
    );
  }

  // Filled 스타일 (배경색 있음)
  static InputDecoration filled({
    String? hintText,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.hint,
      errorText: errorText,
      errorStyle: AppTextStyles.error,
      isDense: true,
      filled: true,
      fillColor: AppColors.backgroundLight,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.borderGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.focusBorder),
      ),
    );
  }

  // Underline 스타일
  static InputDecoration underline({
    String? hintText,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.hint,
      errorText: errorText,
      errorStyle: AppTextStyles.error,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      border: const UnderlineInputBorder(),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.dividerDark),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    );
  }

  // Disabled 스타일
  static InputDecoration disabled({
    String? value,
  }) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: AppColors.backgroundBlue,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.border, width: 1),
      ),
    );
  }

  // Password 입력 필드 (visibility toggle 포함)
  static InputDecoration password({
    String? hintText,
    bool obscureText = true,
    VoidCallback? onToggleVisibility,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.hint,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.mediumRadius,
        borderSide: const BorderSide(color: AppColors.primary, width: 1),
      ),
      suffixIcon: onToggleVisibility != null
          ? IconButton(
        onPressed: onToggleVisibility,
        icon: Icon(
          obscureText ? AppIcons.visibilityOff : AppIcons.visibility,
        ),
        color: AppColors.textDisabled,
        splashRadius: 18,
      )
          : null,
    );
  }
}