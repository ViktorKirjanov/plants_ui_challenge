import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/bottom_info_card.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/plant_info.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/top_bar.dart';
import 'package:plants_ui_challenge/pages/product_page/_widgets/vertical_carousel.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.uid});

  final String uid;

  static MaterialPageRoute<void> route({required String uid}) => MaterialPageRoute(
        builder: (_) => ProductPage(uid: uid),
      );

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                VerticalCarousel(),
                BottomInfoCard(),
              ],
            ),
            TopBar(),
            PlantInfo(),
          ],
        ),
      );
}
