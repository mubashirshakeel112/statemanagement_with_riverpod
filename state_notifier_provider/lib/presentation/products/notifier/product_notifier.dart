import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_provider/domain/models/product_model.dart';

 final productNotifier = StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref){
   return ProductNotifier();
 });

final favouriteProvider = Provider<List<ProductModel>>((ref) {
  final allProducts = ref.watch(productNotifier);
  return allProducts.where((product) => product.favourite).toList();
});


class ProductNotifier extends StateNotifier<List<ProductModel>>{
  ProductNotifier() : super([
    ProductModel(name: 'Jeans', price: 2500, quantity: 1, favourite: false),
    ProductModel(name: 'Shirt', price: 1500, quantity: 1, favourite: false),
    ProductModel(name: 'Shoes', price: 5000, quantity: 1, favourite: false),
  ]);

  void increment(int index){
    final updateQuantity = state[index].copyWith(
      quantity: state[index].quantity + 1,
    );
    final updateList = [...state];
    updateList[index] = updateQuantity;
    state = updateList;
  }

  void decrement(int index){
    if(state[index].quantity > 1){
      final updateQuantity = state[index].copyWith(
          quantity: state[index].quantity - 1
      );
      final updateList = [...state];
      updateList[index] = updateQuantity;
      state = updateList;
    }
  }

  void removeProduct(int index){
    final products = [...state];
    products.removeAt(index);
    state = products;
  }

  void favourite(int index) {
    try {
      final updatedItem = state[index].copyWith(
        favourite: !state[index].favourite,
      );

      final updatedList = [...state];
      updatedList[index] = updatedItem;

      state = updatedList;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
