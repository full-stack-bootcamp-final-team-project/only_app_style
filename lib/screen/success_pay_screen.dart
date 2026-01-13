// 예약, 결제 완료 페이지

import 'package:flutter/material.dart';

class SuccessPayScreen extends StatelessWidget {
  const SuccessPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100), // 상단 여백
            // 중앙 원 + 체크 아이콘
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 12,
                        color: const Color(0xFF9D96CA),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.check,
                    size: 80,
                    color: Color(0xFF9D96CA),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            // 결제 완료 텍스트
            const Text(
              '결제가 완료되었습니다!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 40),
            // 예약 확인 버튼
            SizedBox(
              width: 120,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  debugPrint('예약 확인 클릭');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF9C95CA),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  '예약 확인',
                  style: TextStyle(
                    color: Color(0xFF9C95CA),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const Spacer(),
// 결제 버튼 바로 위 회색 구분선
            const Divider(thickness: 1, color: Color(0xFFC1C1C1)),
            // 메인으로 돌아가기 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9D96CA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '메인으로 돌아가기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
