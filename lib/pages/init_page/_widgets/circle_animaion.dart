import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({
    super.key,
    required this.minSize,
    required this.maxSize,
  });

  final double minSize;
  final double maxSize;

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
              width: widget.minSize + _controller.value * (widget.maxSize - widget.minSize),
              height: widget.minSize + _controller.value * (widget.maxSize - widget.minSize),
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
