import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VerticalCarousel extends StatefulWidget {
  const VerticalCarousel({super.key});

  @override
  State<VerticalCarousel> createState() => _VerticalCarouselState();
}

class _VerticalCarouselState extends State<VerticalCarousel> {
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
  Widget build(BuildContext context) => Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 260,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, position) => Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/snake-plant.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150.0,
            right: MediaQuery.of(context).size.width * .2,
            child: SmoothPageIndicator(
              controller: pageController,
              axisDirection: Axis.vertical,
              count: 3,
              textDirection: TextDirection.rtl,
              effect: const ExpandingDotsEffect(
                dotHeight: 6.0,
                dotWidth: 6.0,
                dotColor: AppColors.grey5,
                activeDotColor: AppColors.green2,
                spacing: 6.0,
              ),
            ),
          ),
        ],
      );
}
