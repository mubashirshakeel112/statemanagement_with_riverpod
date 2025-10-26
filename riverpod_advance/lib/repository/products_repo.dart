import 'package:riverpod_advance/domain/models/products_model.dart';
import 'package:riverpod_advance/services/products_service.dart';

class ProductsRepository extends ProductsService {
  final WCProductsService _wcProductsService = WCProductsService();

  @override
  Future<ProductsModel> getProducts() async {
    return await _wcProductsService.getProducts();
  }

  @override
  Future<Product> getProductsById(int id) async{
    return await _wcProductsService.getProductsById(id);
  }
}
