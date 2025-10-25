import 'package:riverpod_advance/domain/models/products_model.dart';

class ProductsState {
  ProductsModel productsModel;
  bool isLoading;
  String errorMessage;

  ProductsState({required this.isLoading, required this.productsModel, required this.errorMessage});

  ProductsState copyWith({bool? isLoading, ProductsModel? productsModel, String? errorMessage}) {
    return ProductsState(
      isLoading: isLoading ?? this.isLoading,
      productsModel: productsModel ?? this.productsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ProductsState.initialize() {
    return ProductsState(isLoading: false, productsModel: ProductsModel(), errorMessage: '');
  }
}
