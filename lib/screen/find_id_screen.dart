import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 로그인 - 아이디 찾기
class FindIdScreen extends StatelessWidget {
  const FindIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text(
          '아이디 찾기',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              /// 이름
              const _Label(text: '이름'),
              const SizedBox(height: 8),
              const _InputField(hintText: '이름을 입력하세요.'),

              const SizedBox(height: 20),

              /// 전화번호
              const _Label(text: '전화번호'),
              const SizedBox(height: 8),
              const _InputField(
                hintText: '전화번호를 입력하세요.',
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 40),

              /// 아이디 찾기 버튼
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF3F6FF),
                    foregroundColor: const Color(0xFF8B8B8B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFFCACACA)),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) =>
                      const EmailResultDialog(email: 'abc@exam.com'),
                    );
                  },
                  child: const Text(
                    '아이디 찾기',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
class _Label extends StatelessWidget {
  final String text;
  const _Label({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;

  const _InputField({
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFFB1B1B1),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCFD0D1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCFD0D1)),
        ),
      ),
    );
  }
}
class EmailResultDialog extends StatelessWidget {
  final String email;
  const EmailResultDialog({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '홍길동 님의 아이디는',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              email,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF9C95CA)),
            ),
            const SizedBox(height: 8),
            const Text('입니다.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 19),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('확인'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C95CA),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
