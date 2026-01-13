import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UiCheckScreen extends StatelessWidget {
  const UiCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI 확인용'),
        backgroundColor: const Color(0xFF9B93CF),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const _Header('0. 로딩 (Loading)'),
          _NavButton('로딩 페이지', '/loading'),

          const _Header('1. 인증 (Authentication)'),
          _NavButton('로그인 페이지', '/login'),
          _NavButton('회원가입 페이지', '/signup'),
          _NavButton('아이디 찾기', '/find-id'),
          _NavButton('비밀번호 찾기 (본인확인)', '/find-password'),
          _NavButton('비밀번호 변경 (로그인용)', '/login-change-password'),

          const _Header('2. 메인 화면'),
          _NavButton('메인 화면 (홈)', '/main'),

          const _Header('3. 검색 관련'),
          _NavButton('검색 필터', '/search-filter'),
          _NavButton('지역 선택', '/search-region'),

          const _Header('4. 지도 관련'),
          _NavButton('지도 화면', '/map'),
          _NavButton('지도 검색 결과', '/map-search'),

          const _Header('5. 찜 목록'),
          _NavButton('찜 목록', '/favorite'),

          const _Header('6. 마이페이지'),
          _NavButton('마이페이지', '/mypage'),
          _NavButton('회원정보 수정', '/profile/edit'),
          _NavButton('비밀번호 변경 (마이페이지)', '/change-password'),

          const _Header('7. 예약 관련'),
          _NavButton('예약 내역', '/my-reservation'),
          _NavButton('예약하기', '/reservation'),

          const _Header('8. 결제 관련'),
          _NavButton('결제 페이지', '/payment'),
          _NavButton('결제 완료', '/payment-success'),

          const _Header('9. 리뷰 관련'),
          _NavButton('내 리뷰', '/my-reviews'),
          _NavButton('리뷰 작성', '/review/write'),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  const _Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9B93CF),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final String path;
  const _NavButton(this.label, this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () => context.go(path),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              path,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF8B8B8B),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}