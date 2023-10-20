import 'package:flutter/cupertino.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 54.0,
        width: 54.0,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(
            color: AppColors.grey1,
            width: 2.0,
          ),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.slider_horizontal_3,
            color: AppColors.grey10,
            size: 28.0,
          ),
        ),
      );
}
