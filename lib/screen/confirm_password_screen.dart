import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 로그인 - 본인확인
class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          '본인 확인',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            /// 이메일
            const Text(
              '이메일',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 6),
            _InputField(
              hint: '이메일을 입력하세요.',
            ),

            const SizedBox(height: 24),

            /// 생년월일
            const Text(
              '생년월일',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                _BirthField(width: 100, hint: '2000'),
                SizedBox(width: 12),
                _BirthField(width: 70, hint: '11'),
                SizedBox(width: 12),
                _BirthField(width: 70, hint: '22'),
              ],
            ),

            const SizedBox(height: 40),

            /// 버튼
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: null, // 비활성 상태
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFF3F6FF),
                  disabledBackgroundColor: const Color(0xFFF3F6FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFFCACACA)),
                  ),
                ),
                child: const Text(
                  '비밀번호 변경',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF8B8B8B),
                    fontWeight: FontWeight.w500,
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

class _InputField extends StatelessWidget {
  final String hint;

  const _InputField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFB1B1B1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCFD0D1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF5A7EFF)),
          ),
        ),
      ),
    );
  }
}



class _BirthField extends StatelessWidget {
  final double width;
  final String hint;

  const _BirthField({
    required this.width,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 46,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xFFB1B1B1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCFD0D1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF5A7EFF)),
          ),
        ),
      ),
    );
  }
}
