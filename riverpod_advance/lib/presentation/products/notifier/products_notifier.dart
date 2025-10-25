import 'package:riverpod_advance/presentation/products/notifier/products_state.dart';
import 'package:riverpod_advance/repository/products_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_notifier.g.dart';

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
  @override
  ProductsState build() {
    return ProductsState.initialize();
  }

  /// Products Repository
  final ProductsRepository _productsRepository = ProductsRepository();

  /// Set Loading
  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  /// Set Error Message
  setErrorMessage(String value){
    state = state.copyWith(errorMessage: value);
  }

  /// Fetch Data
  Future<void> getProducts() async {
    setErrorMessage('');
    setLoading(true);
    try {
      final result = await _productsRepository.getProducts();
      state = state.copyWith(productsModel: result);
    } catch (e) {
      setErrorMessage(e.toString());
      // throw Exception(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
