part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductsEvent {}

class LikeToggle extends ProductsEvent {
  const LikeToggle({required this.id});

  final int id;

  @override
  List<Object> get props => [id];
}
