import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_ui_challenge/models/product_model.dart';
import 'package:plants_ui_challenge/pages/product_page/product_page.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/product_like_button.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class PoductCard extends StatelessWidget {
  const PoductCard({
    super.key,
    required this.product,
    required this.index,
    required this.offset,
  });

  final Product product;
  final int index;
  final double offset;

  @override
  Widget build(BuildContext context) {
    const double foundHeight = 90.0;
    const listTopPadding = 16.0;
    const startAnimationFromIndex = 5;
    final height = MediaQuery.of(context).size.height;
    final currentBottomPosition = height + offset;
    final indexInColumn = index ~/ 2;
    final padding = ScreenUtil().setWidth(32.0);
    final cardHeight = ScreenUtil().setHeight(300.0);
    final delta = cardHeight / 3 * 2;

    late double endPosition;

    if (index % 2 != 0) {
      endPosition = (indexInColumn + 1) * (cardHeight + padding) - padding;
    } else {
      if (index == 0) {
        endPosition = foundHeight;
      } else {
        endPosition = indexInColumn * (cardHeight + padding) - padding + foundHeight + padding;
      }
    }
    endPosition -= listTopPadding;

    double topPaddingValue = 1.0 - (endPosition - currentBottomPosition + delta) / cardHeight;
    double opacityValue = 1.0 - (endPosition - currentBottomPosition + 200.0) / cardHeight;
    if (topPaddingValue < 0.0) topPaddingValue = 0.0;
    if (topPaddingValue > 1.0) topPaddingValue = 1.0;

    if (opacityValue < 0.0) opacityValue = 0.0;
    if (opacityValue > 1.0) opacityValue = 1.0;

    return Padding(
      padding: EdgeInsets.only(top: index > startAnimationFromIndex ? 100.0 * (1.0 - topPaddingValue) : 0.0),
      child: Opacity(
        opacity: index > startAnimationFromIndex ? opacityValue : 1.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  splashColor: AppColors.green.withOpacity(0.05),
                  highlightColor: AppColors.green2.withOpacity(0.05),
                  child: SizedBox(
                    height: cardHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.0,
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).push(ProductPage.route(product: product));
                  },
                ),
              ),
            ),
            Positioned(
              right: 12.0,
              bottom: 14.0,
              child: ProductLikeButton(
                id: product.id,
                isLiked: product.isLiked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => SizedBox.expand(child: child);

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(covariant CustomSliverPersistentHeaderDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
}
