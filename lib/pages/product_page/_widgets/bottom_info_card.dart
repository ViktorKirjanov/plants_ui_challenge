import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/info_icon.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class BottomInfoCard extends StatelessWidget {
  const BottomInfoCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 260.0,
        decoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.0),
            topRight: Radius.circular(45.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoIcon(
                    path: 'assets/svg/spacing.svg',
                    title: 'Height',
                    info: '30cm - 40cm ',
                  ),
                  InfoIcon(
                    path: 'assets/svg/temperature.svg',
                    title: 'Temperature',
                    info: '25°C to 25°C',
                  ),
                  InfoIcon(
                    path: 'assets/svg/plant.svg',
                    title: 'Pot',
                    info: '30cm - 40cm ',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total price',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          r'$12.99',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    width: 210.0,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.green2),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Add to card',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
