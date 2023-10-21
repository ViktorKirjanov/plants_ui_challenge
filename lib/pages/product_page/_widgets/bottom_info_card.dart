import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_ui_challenge/models/product_model.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/info_icon.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class BottomInfoCard extends StatelessWidget {
  const BottomInfoCard({
    super.key,
    required this.product,
  });

  final Product product;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoIcon(
                    path: 'assets/svg/spacing.svg',
                    title: 'Height',
                    info: '${product.minHeight}cm - ${product.maxHeight}cm ',
                  ),
                  InfoIcon(
                    path: 'assets/svg/temperature.svg',
                    title: 'Temperature',
                    info: '${product.minTemperature}°C to ${product.maxTemperature}°C',
                  ),
                  InfoIcon(
                    path: 'assets/svg/plant.svg',
                    title: 'Pot',
                    info: '${product.minPotSize}cm - ${product.maxPotSize}cm',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total price',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(80.0),
                    width: ScreenUtil().setWidth(210.0),
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
