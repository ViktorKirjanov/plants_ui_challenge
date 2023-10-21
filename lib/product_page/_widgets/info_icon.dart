import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/styles/colors.dart';
import 'package:plants_ui_challenge/widgets/svg_wrapper.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({
    super.key,
    required this.path,
    required this.title,
    required this.info,
  });

  final String path;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SvgWrapper(
            path: path,
            size: 40.0,
          ),
          const SizedBox(height: 4.0),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            info,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ],
      );
}
