import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/pages/init_page/_widgets/carousel.dart';
import 'package:plants_ui_challenge/pages/init_page/_widgets/next_button.dart';
import 'package:plants_ui_challenge/pages/init_page/_widgets/skip_button.dart';
import 'package:plants_ui_challenge/pages/init_page/_widgets/slogan.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HorizontalCarousel(),
                  Slogan(),
                  NextButton(),
                ],
              ),
              SkipButton(),
            ],
          ),
        ),
      );
}
