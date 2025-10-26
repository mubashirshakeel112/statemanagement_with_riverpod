import 'package:riverpod_advance/domain/models/products_model.dart';

class ProductsDetailState{
  bool isLoading;
  Product product;
  String errorMessage;

  ProductsDetailState({required this.isLoading, required this.product, required this.errorMessage});

  ProductsDetailState copyWith({bool? isLoading, Product? product, String? errorMessage}){
    return ProductsDetailState(isLoading: isLoading ?? this.isLoading, product: product ?? this.product, errorMessage: errorMessage ?? this.errorMessage);
  }

  factory ProductsDetailState.initialize(){
    return ProductsDetailState(isLoading: false, product: Product(), errorMessage: '');
  }
}