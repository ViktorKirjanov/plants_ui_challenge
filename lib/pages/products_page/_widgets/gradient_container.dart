import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.01),
              AppColors.grey3.withOpacity(.15),
              AppColors.grey3,
            ],
            stops: const [
              0.0,
              0.5,
              1.0,
            ],
          ),
        ),
      );
}
