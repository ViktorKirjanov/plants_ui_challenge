import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
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
    this.isLiked = false,
  });

  final int id;
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
  final bool isLiked;

  @override
  List<Object?> get props => [
        id,
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
        isLiked,
      ];

  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? minHeight,
    int? maxHeight,
    int? minTemperature,
    int? maxTemperature,
    int? minPotSize,
    int? maxPotSize,
    double? price,
    bool? isLiked,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        minHeight: minHeight ?? this.minHeight,
        maxHeight: maxHeight ?? this.maxHeight,
        minTemperature: minTemperature ?? this.minTemperature,
        maxTemperature: maxTemperature ?? this.maxTemperature,
        minPotSize: minPotSize ?? this.minPotSize,
        maxPotSize: maxPotSize ?? this.maxPotSize,
        price: price ?? this.price,
        isLiked: isLiked ?? this.isLiked,
      );
}
