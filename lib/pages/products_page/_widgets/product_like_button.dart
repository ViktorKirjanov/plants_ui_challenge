import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:plants_ui_challenge/blocs/products_bloc/products_bloc.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class ProductLikeButton extends StatelessWidget {
  const ProductLikeButton({
    super.key,
    required this.id,
    required this.isLiked,
  });

  final int id;
  final bool isLiked;

  @override
  Widget build(BuildContext context) => LikeButton(
        size: 30.0,
        circleColor: CircleColor(
          start: AppColors.green.withOpacity(.1),
          end: AppColors.green2.withOpacity(.1),
        ),
        isLiked: isLiked,
        circleSize: 100.0,
        bubblesSize: 50.0,
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppColors.green,
          dotSecondaryColor: AppColors.green2,
        ),
        likeBuilder: (bool isLiked) => Icon(
          CupertinoIcons.heart_circle_fill,
          color: isLiked ? AppColors.green2 : AppColors.grey7,
          size: 30.0,
        ),
        onTap: (isLiked) async {
          context.read<ProductsBloc>().add(LikeToggle(id: id));
          return !isLiked;
        },
      );
}
