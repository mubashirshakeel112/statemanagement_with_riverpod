import 'package:riverpod_advance/presentation/products_detail/notifier/products_detail_state.dart';
import 'package:riverpod_advance/repository/products_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_detail_notifier.g.dart';

@riverpod
class ProductsDetailNotifier extends _$ProductsDetailNotifier {
  @override
  ProductsDetailState build() => ProductsDetailState.initialize();

  final ProductsRepository _productsRepository = ProductsRepository();

  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  setErrorMessage(String value) {
    state = state.copyWith(errorMessage: value);
  }

  Future<void> getProductsById(int id) async {
    setErrorMessage('');
    setLoading(true);
    try {
      final result = await _productsRepository.getProductsById(id);
      state = state.copyWith(product: result);
    } catch (e) {
      setErrorMessage(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
