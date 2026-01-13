import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  final double progress;

  const LoadingBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFDD835),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
