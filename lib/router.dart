import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// Screens Import
import 'package:only_app_style/screen/loading_screen.dart';
import 'package:only_app_style/screen/login_screen.dart';
import 'package:only_app_style/screen/signup_screen.dart';
import 'package:only_app_style/screen/find_id_screen.dart';
import 'package:only_app_style/screen/confirm_password_screen.dart';
import 'package:only_app_style/screen/login_change_password_screen.dart';
import 'package:only_app_style/screen/main_screen.dart';
import 'package:only_app_style/screen/favorite_app.dart';
import 'package:only_app_style/screen/map_screen.dart';
import 'package:only_app_style/screen/map_search_screen.dart';
import 'package:only_app_style/screen/search_filter_screen.dart';
import 'package:only_app_style/screen/search_region_screen.dart';
import 'package:only_app_style/screen/mypage_screen.dart';
import 'package:only_app_style/screen/edit_profile_screen.dart';
import 'package:only_app_style/screen/change_password_screen.dart';
import 'package:only_app_style/screen/my_reservation_screen.dart';
import 'package:only_app_style/screen/mypage_review_screen.dart';
import 'package:only_app_style/screen/mypage_review_write_screen.dart';
import 'package:only_app_style/screen/reservation_screen.dart';
import 'package:only_app_style/screen/payment_screen.dart';
import 'package:only_app_style/screen/success_pay_screen.dart';
import 'package:only_app_style/ui_check.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// 공통 뒤로가기 로직
/// - 이전 페이지가 있으면 pop
/// - 없으면 UI 체크 화면(/)으로 이동
void handleBackNavigation(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go('/');
  }
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    // ==================================================================
    // 0. UI 확인용 화면
    // ==================================================================
    GoRoute(
      path: '/',
      builder: (context, state) => const UiCheckScreen(),
    ),

    // ==================================================================
    // 1. 로딩 화면
    // ==================================================================
    GoRoute(
      path: '/loading',
      builder: (context, state) => const LoadingScreen(),
    ),

    // ==================================================================
    // 2. 인증 (Authentication)
    // ==================================================================
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/find-id',
      builder: (context, state) => const FindIdScreen(),
    ),
    GoRoute(
      path: '/find-password',
      builder: (context, state) => const ConfirmPasswordScreen(),
    ),
    GoRoute(
      path: '/login-change-password',
      builder: (context, state) => const LoginChangePasswordScreen(),
    ),

    // ==================================================================
    // 3. 메인 화면
    // ==================================================================
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),

    // ==================================================================
    // 4. 검색 관련
    // ==================================================================
    GoRoute(
      path: '/search-filter',
      builder: (context, state) => const SearchFilterScreen(),
    ),
    GoRoute(
      path: '/search-region',
      builder: (context, state) => const SearchRegionScreen(),
    ),

    // ==================================================================
    // 5. 지도 관련
    // ==================================================================
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: '/map-search',
      builder: (context, state) => const MapSearchScreen(),
    ),

    // ==================================================================
    // 6. 찜 목록
    // ==================================================================
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoritePage(),
    ),

    // ==================================================================
    // 7. 마이페이지
    // ==================================================================
    GoRoute(
      path: '/mypage',
      builder: (context, state) => const MypageScreen(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/change-password',
      builder: (context, state) => const LoginChangePasswordScreen(),
    ),

    // ==================================================================
    // 8. 예약 관련
    // ==================================================================
    GoRoute(
      path: '/my-reservation',
      builder: (context, state) => const MyReservationScreen(),
    ),
    GoRoute(
      path: '/reservation',
      builder: (context, state) => const ReservationScreen(),
    ),

    // ==================================================================
    // 9. 결제 관련
    // ==================================================================
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/payment-success',
      builder: (context, state) => const SuccessPayScreen(),
    ),

    // ==================================================================
    // 10. 리뷰 관련
    // ==================================================================
    GoRoute(
      path: '/my-reviews',
      builder: (context, state) => const MyreviewScreen(),
    ),
    GoRoute(
      path: '/review/write',
      builder: (context, state) => const ReviewWriteScreen(),
    ),
  ],
);