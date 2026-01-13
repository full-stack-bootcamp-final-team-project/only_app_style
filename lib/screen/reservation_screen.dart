// 예약 페이지

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:only_app_style/router.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isButtonEnabled = false;
  String? _nameError;

  @override
  void initState() {
    super.initState();
    // 입력이 변경될 때 버튼 상태 체크
    _nameController.addListener(_checkButtonState);
    _emailController.addListener(_checkButtonState);
    _phoneController.addListener(_checkButtonState);
  }

  void _checkButtonState() {
    final nameText = _nameController.text;
    final isNameValid = nameText.isNotEmpty &&
        RegExp(r'^[가-힣a-zA-Z\s]+$').hasMatch(nameText); // 한글+영문+공백
    final isEmailValid = _emailController.text.isNotEmpty;
    final isPhoneValid = _phoneController.text.isNotEmpty;

    setState(() {
      _isButtonEnabled = isNameValid && isEmailValid && isPhoneValid;
      _nameError = isNameValid || nameText.isEmpty
          ? null
          : '한글 또는 영문만 입력 가능합니다.';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => handleBackNavigation(context),
        ),
        title: const Text(
          '예약하기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 숙소 정보
                const Text(
                  '그랜드 호스텔 LDK 명동',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                const Text(
                  '프리미어 패밀리 트윈',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  '기준 3인 / 최대 3인',
                  style: TextStyle(fontSize: 12, color: Color(0xFF8B8B8B)),
                ),
                const SizedBox(height: 24),

                // 체크인 / 체크아웃
                Row(
                  children: const [
                    Expanded(
                      child: _DateBox(
                        title: '체크인',
                        value: '2025.12.30 (화)\n15:00',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _DateBox(
                        title: '체크아웃',
                        value: '2026.12.31 (수)\n11:00',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 예약자 정보
                const Text(
                  '예약자 정보',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),

                // 이름
                _InputSection(
                  label: '예약자 이름',
                  hint: '이름을 입력하세요',
                  controller: _nameController,
                  errorText: _nameError,
                ),

                const SizedBox(height: 24),

                // 이메일
                _InputSection(
                  label: '이메일',
                  hint: 'example@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),

                // 휴대번호
                _InputSection(
                  label: '휴대폰 번호',
                  hint: '010-0000-0000',
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
                  ],
                ),
                const SizedBox(height: 40),

                // 결제 정보
                const Text(
                  '결제 정보',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('객실 가격(1박)', style: TextStyle(fontSize: 16)),
                    Text(
                      '153,000원',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // 하단 예약 버튼
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled
                    ? const Color(0xFF9D96CA)
                    : const Color(0xFFE6E6E6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: _isButtonEnabled
                    ? Colors.white
                    : const Color(0xFF9E9E9E),
                disabledBackgroundColor: const Color(0xFFE6E6E6),
                disabledForegroundColor: const Color(0xFF9E9E9E),
                elevation: 0,
              ),
              onPressed: _isButtonEnabled
                  ? () {
                context.go('/payment');
              }
                  : null,
              child: const Text(
                '예약하기',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================
// 날짜 박스
// =====================
class _DateBox extends StatelessWidget {
  final String title;
  final String value;

  const _DateBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8B8B8B),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// 입력 섹션
// =====================
class _InputSection extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  const _InputSection({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8B8B8B),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontWeight: FontWeight.w400,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC1C1C1)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9D96CA), width: 2),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF2A2A)),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF2A2A), width: 2),
            ),
            errorText: errorText,
            errorStyle: const TextStyle(
              fontSize: 11,
              color: Color(0xFFFF2A2A),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}