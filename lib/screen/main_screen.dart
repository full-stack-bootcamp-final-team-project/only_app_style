import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 각 섹션별 스크롤 제어를 위한 컨트롤러
  final ScrollController _adScroll = ScrollController();
  final ScrollController _recentScroll = ScrollController();
  final ScrollController _seoulScroll = ScrollController();
  final ScrollController _jejuScroll = ScrollController();

  // 12개의 가데이터 생성
  final List<Map<String, String>> dummyItems = List.generate(12, (index) => {
    "title": "라발스 호텔 부산 ${index + 1}",
    "price": "86,660원 ~",
    "img": "https://picsum.photos/id/${index + 10}/200/300"
  });

  // 시간별 그라데이션 로직
  Map<String, dynamic> _getGradientSettings() {
    final int hour = DateTime.now().hour;

    // 새벽 (03 ~ 09시 미만)
    if (hour >= 3 && hour < 9) {
      return {
        "colors": [const Color(0xFF5699CD), const Color(0xFFFFECC9)],
        "stops": [0.0, 0.6],
      };
    }
    // 낮 (09 ~ 17시 미만)
    else if (hour >= 9 && hour < 17) {
      return {
        "colors": [const Color(0xFF91CFFF), const Color(0xFFE7EFF0)],
        "stops": [0.0, 0.6],
      };
    }
    // 노을 (17 ~ 21시 미만)
    else if (hour >= 17 && hour < 21) {
      return {
        "colors": [const Color(0xFFA7A6CB), const Color(0xFFE56E50)],
        "stops": [0.0, 1.0],
      };
    }
    // 밤 (21 ~ 03시 미만)
    else {
      return {
        "colors": [const Color(0xFF3A586E), const Color(0xFF4C1D47)],
        "stops": [0.0, 0.5],
      };
    }
  }

  void _scroll(ScrollController controller, bool isLeft) {
    double move = isLeft ? -200 : 200;
    controller.animateTo(
      controller.offset + move,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) screenWidth = 412;

    // 현재 시간에 맞는 그라데이션 설정 가져오기
    final gradientConfig = _getGradientSettings();

    return Scaffold(
      appBar: AppBar(
        title: Text('테스트'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Container(
          width: screenWidth,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: const Alignment(0.0, -0.2),
              colors: gradientConfig["colors"],
              stops: gradientConfig["stops"],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _buildHeader(),
                    Positioned.fill(
                      top: 131,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildAdSection(screenWidth),
                              _buildSection(screenWidth, "최근 본 숙소", false, _recentScroll),
                              _buildSection(screenWidth, "서울", true, _seoulScroll),
                              _buildSection(screenWidth, "제주", true, _jejuScroll),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildBottomBar(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  // 상단 헤더
  Widget _buildHeader() {
    return Positioned(
      top: 60, left: 20, right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 로고
          Image.asset(
            'assets/images/Logo_default.png',
            width: 60,
            height: 48,
            fit: BoxFit.contain,
            // 이미지가 없을 때 에러 방지를 위한 처리 (선택사항)
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, color: Colors.white, size: 48);
            },
          ),

          // 알림
          Icon(Icons.notifications_none, color: Colors.white, size: 32),
          // Image.asset(
          //   'assets/images/alarm.png',
          //   width: 30,
          //   height: 30,
          //   fit: BoxFit.contain,
          //   // 이미지가 없을 때 에러 방지를 위한 처리 (선택사항)
          //   errorBuilder: (context, error, stackTrace) {
          //     return const Icon(Icons.broken_image, color: Colors.white, size: 48);
          //   },
          // ),
        ],
      ),
    );
  }

  // 광고 섹션 (화살표 세로 중앙 정렬)
  Widget _buildAdSection(double width) {
    const double adHeight = 80.0;
    return Container(
      width: width,
      height: 104,
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center, // 자식들을 세로 중앙에 배치
        children: [
          SingleChildScrollView(
            controller: _adScroll,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(5, (i) => Container(
                width: 188, height: adHeight,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: NetworkImage("https://picsum.photos/id/${i+50}/400/200"), fit: BoxFit.cover),
                ),
              )),
            ),
          ),
          // 화살표 위치: (광고 높이 80 / 2) + 상단 여백 고려하여 배치
          _buildArrowBtn(left: 8, isLeft: true, onTap: () => _scroll(_adScroll, true)),
          _buildArrowBtn(left: width - 24, isLeft: false, onTap: () => _scroll(_adScroll, false)),
        ],
      ),
    );
  }

  // 일반 숙소 섹션 (12개 가데이터 적용)
  Widget _buildSection(double width, String title, bool isHot, ScrollController controller) {
    return Container(
      width: width,
      height: 230,
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          // 타이틀
          Positioned(
            left: 16, top: 22,
            child: Row(
              children: [
                Text(title, style: const TextStyle(color: Color(0xFF2F2F2F), fontSize: 14, fontWeight: FontWeight.bold)),
                if (isHot) ...[
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    color: const Color(0xFF303030),
                    child: const Text('HOT', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ]
              ],
            ),
          ),
          // 상품 카드 영역
          Positioned(
            top: 49, left: 0, right: 0,
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: dummyItems.map((item) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 89, height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: NetworkImage(item['img']!), fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item['title']!, style: const TextStyle(color: Color(0xFF303030), fontSize: 10)),
                      Text(item['price']!, style: const TextStyle(color: Color(0xFF303030), fontSize: 10, fontWeight: FontWeight.w600)),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ),
          // 숙소 리스트의 이미지 세로 중앙(top: 100 부근)에 화살표 배치
          _buildArrowBtn(left: 8, top: 100, isLeft: true, onTap: () => _scroll(controller, true)),
          _buildArrowBtn(left: width - 24, top: 100, isLeft: false, onTap: () => _scroll(controller, false)),
        ],
      ),
    );
  }

  // 공용 화살표 버튼 위젯
  Widget _buildArrowBtn({required double left, double? top, required bool isLeft, required VoidCallback onTap}) {
    return Positioned(
      left: left,
      top: top, // 지정되지 않으면 Stack의 alignment(중앙)에 따름
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 16, height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFD2D2D2), width: 1),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Icon(isLeft ? Icons.chevron_left : Icons.chevron_right, size: 14, color: const Color(0xFFD2D2D2)),
        ),
      ),
    );
  }

  // 탭
  Widget _buildBottomBar(double width) {
    return Container(
      width: width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, -4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 홈 아이콘 (선택됨 - 연한 보라색 배경 추가)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.home_filled, color: Color(0xFFA7A6CB), size: 28),
          ),
          const Icon(Icons.search, color: Colors.black, size: 28),
          const Icon(Icons.map_outlined, color: Colors.black, size: 28),
          const Icon(Icons.favorite_border, color: Colors.black, size: 28),
          const Icon(Icons.person_outline, color: Colors.black, size: 28),
        ],
      ),
    );
  }
}