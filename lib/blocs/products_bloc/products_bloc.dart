import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_ui_challenge/data/constants.dart';
import 'package:plants_ui_challenge/models/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(InitialProductsState()) {
    on<GetProducts>(_onGetProductsEvent);
    on<LikeToggle>(_onLikeToggle);
  }

  Future<void> _onGetProductsEvent(
    GetProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(LoadingProductsState());
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(const SuccessProductsState(products: products));
  }

  Future<void> _onLikeToggle(
    LikeToggle event,
    Emitter<ProductsState> emit,
  ) async {
    final newProducts = [...(state as SuccessProductsState).products];
    final index = newProducts.indexWhere((element) => element.id == event.id);
    print("----index: $index");
    final newValue = !newProducts[index].isLiked;
    final newProduct = newProducts[index].copyWith(isLiked: newValue);
    newProducts[index] = newProduct;
    emit(SuccessProductsState(products: newProducts));
  }
}
