import 'package:flutter/cupertino.dart';
import 'package:only_app_style/screen/loading_screen.dart';
import 'package:only_app_style/widgets/loading_bar.dart';
import 'package:only_app_style/widgets/loading_text.dart';

class LoadingBarWidget extends StatefulWidget {
  const LoadingBarWidget({super.key});

  @override
  State<LoadingBarWidget> createState() => _LoadingBarWidgetState();
}

class _LoadingBarWidgetState extends State<LoadingBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 로딩 바와 아이콘
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizedBox(
              height: 50,
              child: Stack(
                children: [
                  // 로딩 바
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: LoadingBar(progress: _animation.value),
                  ),

                  // 자동차 아이콘 (프로그래스바 상단 border에 위치)
                  Positioned(
                    left: _animation.value * (MediaQuery.of(context).size.width - 100) - 15,
                    bottom: 5,
                    child: const Text('🚗', style: TextStyle(fontSize: 30)),
                  ),

                  // 집 아이콘 (프로그래스바 상단 border에 위치)
                  Positioned(
                    right: -5,
                    bottom: 5,
                    child: const Text('🏠', style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // 로딩 텍스트
        const LoadingText(),
      ],
    );
  }
}
