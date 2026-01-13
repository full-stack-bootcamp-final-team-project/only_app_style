import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

/// =====================
/// 카드 스타일 정의
/// =====================
class AppCardStyles {
  // Private constructor to prevent instantiation
  AppCardStyles._();

  // 기본 카드
  static BoxDecoration standard = BoxDecoration(
    color: Colors.white,
    borderRadius: AppBorderRadius.largeRadius,
    border: Border.all(color: const Color(0x558B8B8B)),
  );

  // 그림자 있는 카드
  static BoxDecoration elevated = BoxDecoration(
    color: Colors.white,
    borderRadius: AppBorderRadius.largeRadius,
    boxShadow: AppShadows.medium,
  );

  // 테두리 있는 카드
  static BoxDecoration outlined = BoxDecoration(
    color: Colors.white,
    borderRadius: AppBorderRadius.mediumRadius,
    border: Border.all(color: AppColors.border),
  );
}

/// =====================
/// 그라디언트 정의
/// =====================
class AppGradients {
  // Private constructor to prevent instantiation
  AppGradients._();

  // 메인 그라디언트 (노을)
  static const sunset = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.gradientStart,
      AppColors.gradientEnd,
    ],
    stops: [0.0, 1.0],
  );

  // 새벽 그라디언트
  static const dawn = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0.0, -0.2),
    colors: [
      Color(0xFF5699CD),
      Color(0xFFFFECC9),
    ],
    stops: [0.0, 0.6],
  );

  // 낮 그라디언트
  static const day = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0.0, -0.2),
    colors: [
      Color(0xFF91CFFF),
      Color(0xFFE7EFF0),
    ],
    stops: [0.0, 0.6],
  );

  // 밤 그라디언트
  static const night = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0.0, -0.2),
    colors: [
      Color(0xFF3A586E),
      Color(0xFF4C1D47),
    ],
    stops: [0.0, 0.5],
  );
}