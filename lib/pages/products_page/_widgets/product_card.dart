import 'package:flutter/cupertino.dart';
import 'package:plants_ui_challenge/models/product_model.dart';
import 'package:plants_ui_challenge/pages/product_page/product_page.dart';
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
    const delta = 200.0;
    const double foundHeight = 90.0;
    const listTopPadding = 16.0;
    const startAnimationFromIndex = 5;
    final height = MediaQuery.of(context).size.height;
    final currentBottomPosition = height + offset;
    final indexInColumn = index ~/ 2;
    late double endPosition;

    if (index % 2 != 0) {
      endPosition = (indexInColumn + 1) * (300.0 + 32.0) - 32.0;
    } else {
      if (index == 0) {
        endPosition = foundHeight;
      } else {
        endPosition = indexInColumn * (300.0 + 32.0) - 32.0 + foundHeight + 32.0;
      }
    }
    endPosition -= listTopPadding;

    double topPaddingValue = 1.0 - (endPosition - currentBottomPosition + delta) / 300.0;
    double opacityValue = 1.0 - (endPosition - currentBottomPosition + 200.0) / 300.0;
    if (topPaddingValue < 0.0) topPaddingValue = 0.0;
    if (topPaddingValue > 1.0) topPaddingValue = 1.0;

    if (opacityValue < 0.0) opacityValue = 0.0;
    if (opacityValue > 1.0) opacityValue = 1.0;

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: index > startAnimationFromIndex ? 100.0 * (1.0 - topPaddingValue) : 0.0),
        child: Opacity(
          opacity: index > startAnimationFromIndex ? opacityValue : 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 300.0,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for testing purposes only
                  // Text('topPaddingValue : ${topPaddingValue.toStringAsFixed(2)}'),
                  // Text('offset: ${offset.toStringAsFixed(2)}'),
                  // Text('position: ${currentBottomPosition.toStringAsFixed(2)}'),
                  // Text('end position: ${endPosition.toStringAsFixed(2)}'),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.0,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.heart_circle_fill,
                              size: 30.0,
                              color: AppColors.grey7,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.of(context).push(ProductPage.route(product: product));
      },
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
