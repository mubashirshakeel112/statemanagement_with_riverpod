import 'package:http/http.dart' as http;
import 'package:riverpod_advance/constant/endpoints.dart';
import 'package:riverpod_advance/domain/models/products_model.dart';
import 'package:riverpod_advance/extension.dart';
import 'package:riverpod_advance/infrastructure/api_exception.dart';

abstract class ProductsService {
  Future<ProductsModel> getProducts();
}

class WCProductsService extends ProductsService {
  @override
  Future<ProductsModel> getProducts() async {
    try {
      Uri endpoint = Uri.parse(Endpoints.products);
      http.Response response = await http.get(endpoint);
      if (response.isApiSuccessful) {
        return productsModelFromJson(response.body);
      } else {
        throw ApiException('Get', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
