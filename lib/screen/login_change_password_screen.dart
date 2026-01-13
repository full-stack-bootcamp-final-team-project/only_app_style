import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 로그인 - 비밀번호 변경
class LoginChangePasswordScreen extends StatelessWidget {
  const LoginChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 상단 AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          '비밀번호 변경',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// 본문
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            /// 새 비밀번호
            const Text(
              '새 비밀번호',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 6),
            _PasswordField(
              hint: '비밀번호를 입력하세요.',
            ),

            const SizedBox(height: 16),

            /// 비밀번호 확인
            const Text(
              '비밀번호 확인',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 6),
            _PasswordField(
              hint: '비밀번호를 다시 입력하세요.',
            ),

            const SizedBox(height: 40),

            /// 변경 버튼
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
                  '변경하기',
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

class _PasswordField extends StatelessWidget {
  final String hint;

  const _PasswordField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFB1B1B1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFCACACA)),
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
