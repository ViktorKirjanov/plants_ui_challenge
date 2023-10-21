import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) => SliverFillRemaining(
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: AppColors.green,
            size: 50.0,
          ),
        ),
      );
}
