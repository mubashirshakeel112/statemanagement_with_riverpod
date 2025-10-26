import 'package:http/http.dart' as http;
import 'package:riverpod_advance/constant/endpoints.dart';
import 'package:riverpod_advance/domain/models/carts_model.dart';
import 'package:riverpod_advance/extension.dart';
import 'package:riverpod_advance/infrastructure/api_exception.dart';

abstract class CartsService {
  Future<CartsModel> getCarts();
}

class WCCartsService extends CartsService {
  @override
  Future<CartsModel> getCarts() async {
    try {
      Uri endpoint = Uri.parse(Endpoints.carts);
      http.Response response = await http.get(endpoint);
      if (response.isApiSuccessful) {
        return cartsModelFromJson(response.body);
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
