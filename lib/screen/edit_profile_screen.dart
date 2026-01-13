import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*
 * 마이페이지 - 회원정보 수정 스크린
 */
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ✅ DB에서 받아온 값(예시) - 실제로는 API/Provider로 주입
  final String _emailFromDb = 'gangster@exam.com';
  final int _birthYearFromDb = 2000;
  final int _birthMonthFromDb = 11;
  final int _birthDayFromDb = 22;

  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;

  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();

    // ✅ DB에서 받아온 값(예시) - 이름/연락처도 초기값 세팅 가능
    _nameCtrl = TextEditingController(text: '김철훈');
    _phoneCtrl = TextEditingController(text: '010-1234-1234');

    _nameCtrl.addListener(_recalc);
    _phoneCtrl.addListener(_recalc);
    _recalc();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _recalc() {
    final ok = _nameCtrl.text.trim().isNotEmpty && _phoneCtrl.text.trim().isNotEmpty;
    if (ok != _canSubmit) {
      setState(() => _canSubmit = ok);
    }
  }

  Future<void> _onSubmit() async {
    if (!_canSubmit) return;

    final name = _nameCtrl.text.trim();
    final phone = _phoneCtrl.text.trim();

    // TODO: 회원정보 수정 API 호출
    // 예) await userService.updateProfile(name: name, phone: phone);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('회원정보가 수정되었습니다'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1200),
      ),
    );

    // TODO: 마이페이지/이전 화면으로 이동
    // context.pop();
    context.go('/');  // 추후 마이페이지 경로로 변경
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final maxWidth = w >= 600 ? 520.0 : double.infinity;
    final maxWidth = w >= 600 ? w : double.infinity;

    const enabledBtnColor = Color(0xFF9B93CF); // ✅ 기존 스크린 계열 보라색
    const disabledBtnColor = Color(0xFFE6E6E6);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/');  // 추후 마이페이지 경로로 변경
          },
        ),
        title: const Text(
          '회원정보 수정',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Color(0xFFE5E5E5)),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 18, 30, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 이메일 (Disabled)
                  const _FieldLabel('이메일'),
                  const SizedBox(height: 6),
                  _DisabledField(value: _emailFromDb),

                  const SizedBox(height: 14),

                  // 이름 (Editable)
                  const _FieldLabel('이름'),
                  const SizedBox(height: 6),
                  _InputField(
                    controller: _nameCtrl,
                    hintText: '이름을 입력하세요.',
                    keyboardType: TextInputType.name,
                  ),

                  const SizedBox(height: 14),

                  // 연락처 (Editable)
                  const _FieldLabel('연락처'),
                  const SizedBox(height: 6),
                  _InputField(
                    controller: _phoneCtrl,
                    hintText: '연락처를 입력하세요.',
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 14),

                  // 생년월일 (Disabled - 3칸)
                  const _FieldLabel('생년월일'),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(child: _DisabledField(value: '$_birthYearFromDb')),
                      const SizedBox(width: 10),
                      Expanded(child: _DisabledField(value: '$_birthMonthFromDb')),
                      const SizedBox(width: 10),
                      Expanded(child: _DisabledField(value: '$_birthDayFromDb')),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 버튼
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: _canSubmit ? _onSubmit : null,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: _canSubmit ? enabledBtnColor : disabledBtnColor,
                        foregroundColor: _canSubmit ? Colors.white : const Color(0xFF9E9E9E),
                        disabledBackgroundColor: disabledBtnColor,
                        disabledForegroundColor: const Color(0xFF9E9E9E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        '수정하기',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Color(0xFF8B8B8B),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _DisabledField extends StatelessWidget {
  final String value;
  const _DisabledField({required this.value});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFFF2F4FB), // ✅ 사진 느낌의 연한 블루/그레이
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE3E3E3), width: 1),
        ),
      ),
      style: const TextStyle(
        color: Color(0xFF9E9E9E),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const _InputField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFBDBDBD),
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE3E3E3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF9B93CF), width: 1),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
