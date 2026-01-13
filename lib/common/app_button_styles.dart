import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

/// =====================
/// 버튼 스타일 정의
/// =====================
class AppButtonStyles {
  // Private constructor to prevent instantiation
  AppButtonStyles._();

  // Primary 버튼
  static ButtonStyle primary = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.mediumRadius,
    ),
    textStyle: AppTextStyles.buttonBold,
  );

  // Secondary 버튼
  static ButtonStyle secondary = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.buttonGray,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.mediumRadius,
    ),
    textStyle: AppTextStyles.buttonBold,
  );

  // Disabled 버튼
  static ButtonStyle disabled = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.buttonDisabled,
    foregroundColor: AppColors.textDisabled,
    disabledBackgroundColor: AppColors.buttonDisabled,
    disabledForegroundColor: AppColors.textDisabled,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.mediumRadius,
    ),
  );

  // Error 버튼
  static ButtonStyle error = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.errorLight,
    foregroundColor: AppColors.error,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.mediumRadius,
    ),
    textStyle: AppTextStyles.buttonBold,
  );

  // Outlined 버튼
  static ButtonStyle outlined = OutlinedButton.styleFrom(
    side: const BorderSide(color: AppColors.borderLight),
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.mediumRadius,
    ),
    textStyle: AppTextStyles.buttonBold,
  );

  // 동적 버튼 스타일 (enabled/disabled 상태)
  static ButtonStyle dynamic({
    required bool enabled,
    Color? enabledColor,
    Color? disabledColor,
  }) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: enabled
          ? (enabledColor ?? AppColors.primary)
          : (disabledColor ?? AppColors.buttonDisabled),
      foregroundColor: enabled
          ? Colors.white
          : AppColors.textDisabled,
      disabledBackgroundColor: disabledColor ?? AppColors.buttonDisabled,
      disabledForegroundColor: AppColors.textDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      textStyle: AppTextStyles.buttonBold,
    );
  }
}