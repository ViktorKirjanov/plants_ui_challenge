import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.avatarValue,
  });

  final double avatarValue;

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: avatarValue,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            height: 54.0,
            width: 54.0,
            child: Center(
              child: Container(
                height: 54.0 * avatarValue,
                width: 54.0 * avatarValue,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(54.0),
                  child: Image.asset('assets/images/avatar.jpeg'),
                ),
              ),
            ),
          ),
        ),
      );
}
