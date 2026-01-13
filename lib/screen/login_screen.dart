import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 로그인
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('테스트'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60),

                // 로고
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Union.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // 로그인 구분선
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('로그인', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                SizedBox(height: 32),

                // 아이디
                TextField(
                  decoration: InputDecoration(
                    hintText: '아이디를 입력하세요.',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Color(0xFFC9C9C9)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFB7B7B7)),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // 비밀번호
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요.',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Color(0xFFC9C9C9)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFB7B7B7)),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                // 아이디 저장
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (_) {},
                      activeColor: Color(0xFF9C95CA),
                    ),
                    Text(
                      '아이디 저장',
                      style: TextStyle(color: Color(0xFF9C95CA)),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                // 로그인 버튼
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9C95CA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('로그인', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),

                SizedBox(height: 16),

                // 카카오
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('카카오 로그인', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 16),

                // 아이디 / 비밀번호 찾기
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('아이디 찾기', style: TextStyle(color: Color(0xFF9C95CA), fontSize: 16)),
                    SizedBox(width: 12),
                    Text('|'),
                    SizedBox(width: 12),
                    Text('비밀번호 찾기', style: TextStyle(color: Color(0xFF9C95CA), fontSize: 16)),
                  ],
                ),

                SizedBox(height: 48),

                SizedBox(height: 48),

                // 회원가입
                Column(
                  children: [
                    Text(
                      '아직 계정이 없나요?',
                      style: TextStyle(color: Color(0xFF9C95CA), fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text('회원가입하기', style: TextStyle(fontSize: 16)),
                  ],
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
