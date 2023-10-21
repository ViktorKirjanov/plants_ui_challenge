import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class SvgWrapper extends StatelessWidget {
  const SvgWrapper({
    super.key,
    required this.path,
    this.color = AppColors.white,
    this.disableColorOverride = false,
    this.blendMode = BlendMode.srcIn,
    this.size,
  });

  final String path;
  final Color color;
  final bool disableColorOverride;
  final BlendMode blendMode;
  final double? size;

  @override
  Widget build(BuildContext context) => Center(
        child: SvgPicture.asset(
          path,
          colorFilter: disableColorOverride ? null : ColorFilter.mode(color, blendMode),
          width: size,
          height: size,
        ),
      );
}
