import 'package:flutter/cupertino.dart';
import 'package:plants_ui_challenge/pages/products_page/products_page.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
        top: 6.0,
        right: 12.0,
        child: CupertinoButton(
          child: const Text(
            'Skip',
            style: TextStyle(color: AppColors.grey7),
          ),
          onPressed: () => Navigator.of(context).push(ProductsPage.route()),
        ),
      );
}
