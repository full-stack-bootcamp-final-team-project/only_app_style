import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // context.pop 사용 위해 추가
import 'package:only_app_style/widgets/loading_bar_widget.dart';
import 'package:only_app_style/widgets/logo_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreenBody(),
    );
  }
}

class LoadingScreenBody extends StatelessWidget {
  const LoadingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('테스트'),
          leading: IconButton(
            onPressed: () => context.go('/'),
            icon: Icon(Icons.arrow_back),
          ),
        ),
body:  Container(
  width: double.infinity,
  height: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA7A6CB),
        Color(0xFFE56E50),
      ],
      stops: [0.0, 0.5, 1.0],
    ),
  ),
  child: SafeArea(
    child: Stack(
      children: [
        Positioned(
          left: 16,
          top: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/ui-check');
              }
            },
          ),
        ),

        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 150),
            child: LogoWidget(),
          ),
        ),

        const Positioned(
          left: 30,
          right: 30,
          bottom: 120,
          child: LoadingBarWidget(),
        ),
      ],
    ),
  ),
),
      );

  }
}