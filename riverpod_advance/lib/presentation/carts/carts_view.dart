import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_advance/presentation/carts/notifier/carts_notifier.dart';
import 'package:riverpod_advance/widgets/custom_shimmer.dart';

class CartsView extends ConsumerStatefulWidget {
  static const String id = '/carts_view';

  const CartsView({super.key});

  @override
  ConsumerState<CartsView> createState() => _CartsViewState();
}

class _CartsViewState extends ConsumerState<CartsView> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(cartsProvider.notifier).getCarts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartsState = ref.watch(cartsProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: Text(
          'Carts',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartsState.isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.deepPurple))
                : cartsState.errorMessage.isNotEmpty
                ? Center(
              child: Text(
                "oop's Something went wrong!",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: cartsState.cartsModel.carts?.length ?? 0,
              itemBuilder: (context, index) {
                final cart = cartsState.cartsModel.carts?[index];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart?.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = cart?.products?[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            if (product?.thumbnail != null)
                              Container(
                                width: 100,
                                height: 70,
                                child: CachedNetworkImage(
                                  imageUrl: product!.thumbnail!,
                                  placeholder: (context, url) =>
                                      Center(child: CustomShimmer(width: 100, height: 70, radius: 12)),
                                  errorWidget: (context, url, error) => Icon(Icons.photo),
                                ),
                              ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?.title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // Text('', maxLines: 1, overflow: TextOverflow.ellipsis),
                                  Row(
                                    children: [
                                      Text(
                                        '\$ ${product?.price.toString()}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '${product?.discountPercentage.toString()} % OFF',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$ ${calculateDiscount(product!.price!, product.discountPercentage!)
                                        .toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }

  double calculateDiscount(double price, double discount) {
    return price - (price * discount / 100);
  }
}
