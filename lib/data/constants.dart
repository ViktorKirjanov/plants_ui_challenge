import 'package:plants_ui_challenge/models/product_model.dart';

const initPlants = [
  'assets/images/snake-plant.png',
  'assets/images/fittonia.png',
  'assets/images/aloe.png',
];

const products = [
  Product(
    name: 'Snake plant',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    image: 'assets/images/snake-plant.png',
    minHeight: 10,
    maxHeight: 20,
    minTemperature: 15,
    maxTemperature: 25,
    minPotSize: 10,
    maxPotSize: 25,
    price: 12.99,
  ),
  Product(
    name: 'Lucky jade plant',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    image: 'assets/images/lucky-jade-plant.png',
    minHeight: 15,
    maxHeight: 25,
    minTemperature: 10,
    maxTemperature: 30,
    minPotSize: 15,
    maxPotSize: 25,
    price: 10.99,
  ),
  Product(
    name: 'Aloe',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    image: 'assets/images/aloe.png',
    minHeight: 25,
    maxHeight: 30,
    minTemperature: 15,
    maxTemperature: 25,
    minPotSize: 5,
    maxPotSize: 25,
    price: 25.99,
  ),
  Product(
    name: 'Fittonia',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    image: 'assets/images/fittonia.png',
    minHeight: 10,
    maxHeight: 20,
    minTemperature: 15,
    maxTemperature: 25,
    minPotSize: 10,
    maxPotSize: 30,
    price: 149.99,
  ),
];
