import 'package:flutter/material.dart';
import 'package:only_app_style/router.dart';
/*------------------------------------


이미지 아이콘 분석 및 유사 아이콘

1. ⭐ 별 아이콘
Icons.star:채워진 별
Icons.star_border:테두리만 있는 별
Icons.star_half:반쪽 별
Icons.star_outline:아웃라인 별
Icons.grade:등급/별

2. ➖ 마이너스/빼기 아이콘
Icons.remove:빼기/제거
Icons.minimize:최소화
Icons.horizontal_rule:수평선

3. ➕ 플러스/더하기 아이콘 (Image 3)
Icons.add:추가
Icons.add_circle:원형 추가
Icons.add_circle_outline:원형 테두리 추가
Icons.plus_one:플러스 원

4. 📅 캘린더 아이콘
Icons.calendar_today:오늘 캘린더
Icons.calendar_month:월 캘린더
Icons.event:이벤트/일정
Icons.date_range:날짜 범위
Icons.schedule:스케줄

5. 👤 사용자/프로필 아이콘
Icons.person:사람
Icons.person_outline:사람 아웃라인
Icons.account_circle:계정 원형
Icons.face:얼굴
Icons.supervised_user_circle:관리 사용자

평가/피드백:
Icons.favorite:하트
Icons.thumb_up:좋아요
Icons.rating:평점

수량 조절:
Icons.exposure_plus_1:+1
Icons.exposure_minus_1:-1

날짜/시간:
Icons.access_time:시계
Icons.today:오늘

사용자 관리:
Icons.people:여러 사람
Icons.group:그룹
------------------------------------*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'UI Check',
      routerConfig: router,
    );
  }
}