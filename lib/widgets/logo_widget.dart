import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // PNG 이미지로 대체
          Image.asset(
            'assets/images/logo_default.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          // 또는 네트워크 이미지를 사용하는 경우:
          // Image.network(
          //   'https://your-image-url.com/house_logo.png',
          //   width: 150,
          //   height: 150,
          //   fit: BoxFit.contain,
          // ),
        ],
      ),
    );
  }
}