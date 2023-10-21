import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/pages/products_page/products_page.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 2,
        child: Center(
          child: SizedBox(
            height: 100.0,
            width: 100.0,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).push(ProductsPage.route()),
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 60.0,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      );
}
