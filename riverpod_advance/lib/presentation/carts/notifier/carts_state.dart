import 'package:riverpod_advance/domain/models/carts_model.dart';

class CartsState {
  bool isLoading;
  CartsModel cartsModel;
  String errorMessage;

  CartsState({required this.isLoading, required this.cartsModel, required this.errorMessage});

  CartsState copyWith({bool? isLoading, CartsModel? cartsModel, String? errorMessage}) {
    return CartsState(
      isLoading: isLoading ?? this.isLoading,
      cartsModel: cartsModel ?? this.cartsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory CartsState.initialize() {
    return CartsState(isLoading: false, cartsModel: CartsModel(), errorMessage: '');
  }
}
