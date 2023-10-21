import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_ui_challenge/data/constants.dart';
import 'package:plants_ui_challenge/models/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(InitialProductsState()) {
    on<GetProductsEvent>(
      _onGetProductsEvent,
    );
  }

  Future<void> _onGetProductsEvent(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(LoadingProductsState());
    await Future<void>.delayed(const Duration(seconds: 3));

    final List<Product> productList = [
      ...products,
      ...products,
      ...products,
      ...products,
      ...products,
    ];

    emit(SuccessProductsState(products: productList));
  }
}
