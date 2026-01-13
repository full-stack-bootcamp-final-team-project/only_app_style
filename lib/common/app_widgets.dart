import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';
import 'app_button_styles.dart';
import 'app_icons.dart';

/// =====================
/// 공통 위젯 컴포넌트
/// =====================
class AppWidgets {
  // Private constructor to prevent instantiation
  AppWidgets._();

  /// 필드 라벨 (회색, 작은 폰트)
  static Widget fieldLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.label,
    );
  }

  /// 에러 텍스트 (없으면 최소 공간만 차지)
  static Widget errorText(String? text) {
    if (text == null) return const SizedBox(height: 6);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        style: AppTextStyles.error,
      ),
    );
  }

  /// Disabled 텍스트 필드 (수정 불가, 회색 배경)
  static Widget disabledTextField({
    required String value,
  }) {
    return TextField(
      enabled: false,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.backgroundBlue,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.mediumRadius,
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColors.textDisabled,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// 확인 다이얼로그 (공통)
  static Future<bool?> showConfirmDialog({
    required BuildContext context,
    required String message,
    String cancelText = '취소',
    String confirmText = '확인',
    Color confirmColor = AppColors.primary,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.largeRadius,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 14),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context, false),
                                style: AppButtonStyles.outlined,
                                child: Text(cancelText),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: confirmColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: AppBorderRadius.mediumRadius,
                                  ),
                                ),
                                child: Text(
                                  confirmText,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: IconButton(
                  onPressed: () => Navigator.pop(context, false),
                  icon: const Icon(AppIcons.close, size: 18),
                  splashRadius: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// SnackBar 표시
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 1200),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }

  /// AppBar (공통)
  static AppBar appBar({
    required String title,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
    bool showDivider = true,
  }) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: onBackPressed != null
          ? IconButton(
        icon: const Icon(AppIcons.back, color: Colors.black),
        onPressed: onBackPressed,
      )
          : null,
      title: Text(
        title,
        style: AppTextStyles.title,
      ),
      actions: actions,
      bottom: showDivider
          ? const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: AppColors.divider,
        ),
      )
          : null,
    );
  }
}