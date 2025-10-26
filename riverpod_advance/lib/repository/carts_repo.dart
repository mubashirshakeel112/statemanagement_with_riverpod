import 'package:riverpod_advance/domain/models/carts_model.dart';
import 'package:riverpod_advance/services/carts_service.dart';

class CartsRepository extends CartsService{
  final WCCartsService _wcCartsService = WCCartsService();
  @override
  Future<CartsModel> getCarts() async{
    return await _wcCartsService.getCarts();
  }
}