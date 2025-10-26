import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_advance/constant/endpoints.dart';
import 'package:riverpod_advance/domain/models/products_model.dart';
import 'package:riverpod_advance/extension.dart';
import 'package:riverpod_advance/infrastructure/api_exception.dart';

abstract class ProductsService {
  Future<ProductsModel> getProducts();

  Future<Product> getProductsById(int id);
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

  @override
  Future<Product> getProductsById(int id) async {
    try {
      Uri endpoint = Uri.parse('${Endpoints.products}$id');
      http.Response response = await http.get(endpoint);
      if (response.isApiSuccessful) {
        Map<String, dynamic> result = jsonDecode(response.body) as Map<String, dynamic>;
        return Product.fromJson(result);
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
