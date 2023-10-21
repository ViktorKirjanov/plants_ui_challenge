import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
        left: 12.0,
        top: 12.0,
        right: 12.0,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.black,
                ),
                onPressed: Navigator.of(context).pop,
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
