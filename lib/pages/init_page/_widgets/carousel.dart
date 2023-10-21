import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/data/constants.dart';
import 'package:plants_ui_challenge/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HorizontalCarousel extends StatefulWidget {
  const HorizontalCarousel({super.key});

  @override
  State<HorizontalCarousel> createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<HorizontalCarousel> {
  final pageController = PageController(
    viewportFraction: 1.0,
    keepPage: true,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 6,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: initPlants.length,
                itemBuilder: (context, index) => Center(
                  child: Image.asset(
                    initPlants[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              textDirection: TextDirection.ltr,
              effect: const ExpandingDotsEffect(
                dotHeight: 6.0,
                dotWidth: 6.0,
                dotColor: AppColors.grey5,
                activeDotColor: AppColors.green2,
                spacing: 6.0,
              ),
            ),
          ],
        ),
      );
}
