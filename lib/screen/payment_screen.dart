// 결제페이지

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20),

                // 뒤로가기 및 타이틀
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go('/reservation'),
                        child: const Icon(Icons.arrow_back, size: 24),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            '결제하기',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 숙소명
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '그랜드 호스텔 LDK 명동',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '프리미어 패밀리 트윈',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xFFC1C1C1)),
                const SizedBox(height: 10),

                // 객실 가격
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '객실 가격(1박)',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '153,000원',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xFFC1C1C1)),
                const SizedBox(height: 20),

                // 결제 수단 이미지 박스
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    height: 197,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage("https://placehold.co/371x197"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 체크박스 + 텍스트
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _RememberPaymentCheckbox(),
                ),

                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xFFC1C1C1)),
                const SizedBox(height: 10),

                // 결제 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/success');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9D96CA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '153,000원 결제하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================
// 체크박스 상태 유지용 StatefulWidget
// =====================
class _RememberPaymentCheckbox extends StatefulWidget {
  @override
  State<_RememberPaymentCheckbox> createState() =>
      _RememberPaymentCheckboxState();
}

class _RememberPaymentCheckboxState extends State<_RememberPaymentCheckbox> {
  bool isChecked = true; // 기본 체크 상태 true

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            '이 결제 수단을 다음에도 사용',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
