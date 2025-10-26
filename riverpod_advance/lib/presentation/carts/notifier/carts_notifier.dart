import 'package:riverpod_advance/presentation/carts/notifier/carts_state.dart';
import 'package:riverpod_advance/repository/carts_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carts_notifier.g.dart';

@riverpod
class CartsNotifier extends _$CartsNotifier {
  @override
  CartsState build() => CartsState.initialize();

  final CartsRepository _cartsRepository = CartsRepository();

  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  setErrorMessage(String value) {
    state = state.copyWith(errorMessage: value);
  }

  Future<void> getCarts() async {
    setErrorMessage('');
    setLoading(true);
    try {
      final result = await _cartsRepository.getCarts();
      state = state.copyWith(cartsModel: result);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
