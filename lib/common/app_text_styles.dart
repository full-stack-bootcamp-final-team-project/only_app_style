import 'package:flutter/material.dart';
import 'app_colors.dart';

/// =====================
/// 텍스트 스타일 정의
/// =====================
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // 제목 스타일
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static const titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  // 부제목 스타일
  static const subtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const subtitleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // 본문 스타일
  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // 캡션 스타일
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static const captionSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  // 힌트 스타일
  static const hint = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  static const hintMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  // 버튼 스타일
  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const buttonBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  // 에러 스타일
  static const error = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  // 라벨 스타일
  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
  );
}