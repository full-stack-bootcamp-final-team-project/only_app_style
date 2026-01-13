import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*
 * 마이페이지 - 비밀번호 변경 스크린
 */
class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  // ✅ DB에서 받아온 이메일(예시)
  final String _emailFromDb = 'abc@exam.com';

  final _currentCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  // ✅ 각 필드 아래 오류 텍스트
  String? _currentErr;
  String? _newErr;
  String? _confirmErr;

  bool _canSubmit = false;

  // (선택) "확인" 버튼 클릭 시 기존 비밀번호 검증 여부 표시용
  bool _currentChecked = false;

  @override
  void initState() {
    super.initState();
    _currentCtrl.addListener(_recalc);
    _newCtrl.addListener(_recalc);
    _confirmCtrl.addListener(_recalc);
    _recalc();
  }

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _recalc() {
    final filled = _currentCtrl.text.trim().isNotEmpty &&
        _newCtrl.text.trim().isNotEmpty &&
        _confirmCtrl.text.trim().isNotEmpty;

    if (filled != _canSubmit) {
      setState(() => _canSubmit = filled);
    }

    // 입력 바뀌면 확인 상태 초기화(선택)
    if (_currentChecked) {
      setState(() => _currentChecked = false);
    }

    // 입력 중에는 실시간으로 confirm mismatch만 가볍게 처리(원치 않으면 제거 가능)
    final newPw = _newCtrl.text;
    final confirmPw = _confirmCtrl.text;
    if (confirmPw.isNotEmpty && newPw.isNotEmpty && confirmPw != newPw) {
      if (_confirmErr != '비밀번호가 일치하지 않습니다.') {
        setState(() => _confirmErr = '비밀번호가 일치하지 않습니다.');
      }
    } else {
      if (_confirmErr != null) {
        setState(() => _confirmErr = null);
      }
    }
  }

  Future<void> _checkCurrentPassword() async {
    final currentPw = _currentCtrl.text.trim();
    if (currentPw.isEmpty) {
      setState(() => _currentErr = '기존 비밀번호를 입력해 주세요.');
      return;
    }

    // TODO: 서버에 기존 비밀번호 검증 API 호출
    // 예) final ok = await userService.verifyPassword(currentPw);

    // ✅ 데모: 임시로 "1234"만 맞다고 가정
    final ok = currentPw == '1234';

    setState(() {
      _currentChecked = ok;
      _currentErr = ok ? null : '기존 비밀번호가 올바르지 않습니다.';
    });
  }

  bool _validateAll() {
    final currentPw = _currentCtrl.text.trim();
    final newPw = _newCtrl.text.trim();
    final confirmPw = _confirmCtrl.text.trim();

    String? curErr;
    String? newErr;
    String? confErr;

    if (currentPw.isEmpty) curErr = '기존 비밀번호를 입력해 주세요.';
    if (newPw.isEmpty) newErr = '새 비밀번호를 입력해 주세요.';
    if (confirmPw.isEmpty) confErr = '비밀번호 확인을 입력해 주세요.';

    // 새 비밀번호 정책(원하시는 규칙으로 변경 가능)
    if (newPw.isNotEmpty && newPw.length < 8) {
      newErr = '새 비밀번호는 8자 이상으로 입력해 주세요.';
    }

    if (newPw.isNotEmpty && confirmPw.isNotEmpty && newPw != confirmPw) {
      confErr = '비밀번호가 일치하지 않습니다.';
    }

    setState(() {
      _currentErr = curErr;
      _newErr = newErr;
      _confirmErr = confErr;
    });

    return curErr == null && newErr == null && confErr == null;
  }

  Future<void> _onSubmit() async {
    if (!_canSubmit) return;
    if (!_validateAll()) return;

    // (선택) "확인"을 반드시 누르게 하고 싶으면 아래 조건 사용
    // if (!_currentChecked) {
    //   setState(() => _currentErr = '기존 비밀번호 확인을 먼저 진행해 주세요.');
    //   return;
    // }

    final currentPw = _currentCtrl.text.trim();
    final newPw = _newCtrl.text.trim();

    // TODO: 비밀번호 변경 API 호출
    // 예) await userService.changePassword(currentPw: currentPw, newPw: newPw);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('비밀번호가 수정되었습니다'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1200),
      ),
    );

    // TODO: 이전 화면/마이페이지로 이동
    // context.pop();
    context.go('/');  // 추후 마이페이지 경로로 변경
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final maxWidth = w >= 600 ? 520.0 : double.infinity;
    final maxWidth = w >= 600 ? w : double.infinity;

    const enabledBtnColor = Color(0xFF9B93CF);
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
          '비밀번호 수정',
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
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _FieldLabel('이메일'),
                  const SizedBox(height: 6),
                  _DisabledField(value: _emailFromDb),

                  const SizedBox(height: 14),

                  // 기존 비밀번호 + 확인 버튼
                  const _FieldLabel('기존 비밀번호'),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: _PasswordField(
                          controller: _currentCtrl,
                          hintText: '비밀번호를 입력하세요.',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: _checkCurrentPassword,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF9B93CF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '확인',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _ErrorText(_currentErr),
                  const SizedBox(height: 12),

                  const _FieldLabel('새 비밀번호'),
                  const SizedBox(height: 6),
                  _PasswordField(
                    controller: _newCtrl,
                    hintText: '비밀번호를 입력하세요.',
                  ),
                  _ErrorText(_newErr),
                  const SizedBox(height: 12),

                  const _FieldLabel('비밀번호 확인'),
                  const SizedBox(height: 6),
                  _PasswordField(
                    controller: _confirmCtrl,
                    hintText: '비밀번호를 다시 입력하세요.',
                  ),
                  _ErrorText(_confirmErr),

                  const SizedBox(height: 18),

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

/// 라벨
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

/// Disabled 텍스트필드
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
        fillColor: const Color(0xFFF2F4FB),
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

/// 비밀번호 입력 필드
class _PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const _PasswordField({
    required this.controller,
    required this.hintText,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
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
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscure = !_obscure),
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          color: const Color(0xFF9E9E9E),
          splashRadius: 18,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

/// 오류 텍스트(없으면 공간 최소화)
class _ErrorText extends StatelessWidget {
  final String? text;
  const _ErrorText(this.text);

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox(height: 6);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFFFF2A2A),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
