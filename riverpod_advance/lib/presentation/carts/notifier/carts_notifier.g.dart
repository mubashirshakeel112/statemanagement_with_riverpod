// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartsNotifier)
const cartsProvider = CartsNotifierProvider._();

final class CartsNotifierProvider
    extends $NotifierProvider<CartsNotifier, CartsState> {
  const CartsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartsNotifierHash();

  @$internal
  @override
  CartsNotifier create() => CartsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartsState>(value),
    );
  }
}

String _$cartsNotifierHash() => r'a9a7d021f8c9056fdf479844d9bfba04dd29c687';

abstract class _$CartsNotifier extends $Notifier<CartsState> {
  CartsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CartsState, CartsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CartsState, CartsState>,
              CartsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
