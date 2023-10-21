import 'package:flutter/material.dart';
import 'package:plants_ui_challenge/models/product_model.dart';

class PlantInfo extends StatelessWidget {
  const PlantInfo({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 300.0,
        left: 0.0,
        right: 0.0,
        child: IgnorePointer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.6,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      );
}
