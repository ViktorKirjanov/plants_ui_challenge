import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({super.key, required this.containerHeight});

  final double containerHeight;

  @override
  AnimatedCircleState createState() => AnimatedCircleState();
}

class AnimatedCircleState extends State<AnimatedCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Opacity(
            opacity: 1.0 - _controller.value,
            child: Container(
              width: 100 + _controller.value * (widget.containerHeight - 100),
              height: 100 + _controller.value * (widget.containerHeight - 100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3.0,
                  color: AppColors.green.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      );
}
