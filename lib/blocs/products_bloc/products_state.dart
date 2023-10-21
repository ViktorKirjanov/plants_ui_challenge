part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class InitialProductsState extends ProductsState {}

final class LoadingProductsState extends ProductsState {}

final class SuccessProductsState extends ProductsState {
  const SuccessProductsState({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}

final class FailureProductsState extends ProductsState {}
