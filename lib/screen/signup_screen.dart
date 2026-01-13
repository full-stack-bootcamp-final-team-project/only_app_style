import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 로그인 - 회원가입
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          '회원가입',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label('이메일'),
            inputField(hint: 'abc@exam.com'),

            label('비밀번호'),
            inputField(hint: '비밀번호를 입력하세요.', obscure: true),

            label('비밀번호 확인'),
            inputField(hint: '비밀번호를 다시 입력하세요.', obscure: true),

            label('이름'),
            inputField(hint: '이름을 입력하세요.'),

            label('연락처'),
            inputField(hint: '연락처를 입력하세요.'),

            label('생년월일'),
            Row(
              children: [
                Expanded(child: dropdownField('YYYY')),
                const SizedBox(width: 8),
                Expanded(child: dropdownField('MM')),
                const SizedBox(width: 8),
                Expanded(child: dropdownField('DD')),
              ],
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => context.go('/'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF4F7FF),
                  foregroundColor: Color(0xFF8B8B8B),
                  elevation: 0,
                  side: const BorderSide(
                    color: Color(0xFFCACACA),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- 공통 위젯 ----------

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            const TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField({required String hint, bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F4FF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCACACA)),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  Widget dropdownField(String hint) {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: Color(0xFF494A4B)),
      items: const [],
      onChanged: null,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF0F4FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCACACA)),
        ),
      ),
    );
  }
}
