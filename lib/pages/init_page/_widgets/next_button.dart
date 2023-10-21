import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_ui_challenge/pages/init_page/_widgets/circle_animaion.dart';
import 'package:plants_ui_challenge/pages/products_page/products_page.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 2,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Stack(
            children: [
              AnimatedCircle(
                minSize: ScreenUtil().radius(100),
                maxSize: constraints.maxHeight,
              ),
              Center(
                child: SizedBox(
                  height: ScreenUtil().radius(100),
                  width: ScreenUtil().radius(100),
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
            ],
          ),
        ),
      );
}
