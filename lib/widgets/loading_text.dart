import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'loading...',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }
}