import 'package:flutter/material.dart';

/// =====================
/// 여백(Spacing) 정의
/// =====================
class AppSpacing {
  // Private constructor to prevent instantiation
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 40.0;
}

/// =====================
/// 모서리 둥글기(Border Radius) 정의
/// =====================
class AppBorderRadius {
  // Private constructor to prevent instantiation
  AppBorderRadius._();

  static const double sm = 6.0;
  static const double md = 10.0;
  static const double lg = 12.0;
  static const double xl = 15.0;

  static BorderRadius circular(double radius) => BorderRadius.circular(radius);

  static const smallRadius = BorderRadius.all(Radius.circular(sm));
  static const mediumRadius = BorderRadius.all(Radius.circular(md));
  static const largeRadius = BorderRadius.all(Radius.circular(lg));
  static const extraLargeRadius = BorderRadius.all(Radius.circular(xl));
}

/// =====================
/// 그림자(Shadow) 정의
/// =====================
class AppShadows {
  // Private constructor to prevent instantiation
  AppShadows._();

  static const small = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const medium = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];

  static const large = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 12,
      offset: Offset(0, 3),
    ),
  ];

  static const card = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 5,
      offset: Offset(3, 3),
    ),
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 5,
      offset: Offset(-3, -3),
    ),
  ];

  static const bottomNav = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, -4),
      blurRadius: 10,
      spreadRadius: 0,
    ),
  ];
}