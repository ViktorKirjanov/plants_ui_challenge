import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/models/product_model.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/bottom_info_card.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/plant_info.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/top_bar.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/vertical_carousel.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final Product product;

  static MaterialPageRoute<void> route({required Product product}) => MaterialPageRoute(
        builder: (_) => ProductPage(product: product),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                VerticalCarousel(image: product.image),
                BottomInfoCard(product: product),
              ],
            ),
            const TopBar(),
            PlantInfo(product: product),
          ],
        ),
      );
}
