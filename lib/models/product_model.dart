import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.description,
    required this.image,
    required this.minHeight,
    required this.maxHeight,
    required this.minTemperature,
    required this.maxTemperature,
    required this.minPotSize,
    required this.maxPotSize,
    required this.price,
  });

  final String name;
  final String description;
  final String image;
  final int minHeight;
  final int maxHeight;
  final int minTemperature;
  final int maxTemperature;
  final int minPotSize;
  final int maxPotSize;
  final double price;

  @override
  List<Object?> get props => [
        name,
        description,
        image,
        minHeight,
        maxHeight,
        minTemperature,
        maxTemperature,
        minPotSize,
        maxPotSize,
        price,
      ];
}
