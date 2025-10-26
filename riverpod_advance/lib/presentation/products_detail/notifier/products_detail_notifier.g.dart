// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsDetailNotifier)
const productsDetailProvider = ProductsDetailNotifierProvider._();

final class ProductsDetailNotifierProvider
    extends $NotifierProvider<ProductsDetailNotifier, ProductsDetailState> {
  const ProductsDetailNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsDetailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsDetailNotifierHash();

  @$internal
  @override
  ProductsDetailNotifier create() => ProductsDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsDetailState>(value),
    );
  }
}

String _$productsDetailNotifierHash() =>
    r'83d0e4aee2f08d5945d3ee5dbba41de07b15de73';

abstract class _$ProductsDetailNotifier extends $Notifier<ProductsDetailState> {
  ProductsDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProductsDetailState, ProductsDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductsDetailState, ProductsDetailState>,
              ProductsDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
