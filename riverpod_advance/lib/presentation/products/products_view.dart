import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_advance/presentation/products/notifier/products_notifier.dart';
import 'package:riverpod_advance/presentation/products_detail/products_detail_view.dart';
import 'package:riverpod_advance/presentation/widgets/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ProductsView extends ConsumerStatefulWidget {
  static const String id = '/products_view';

  const ProductsView({super.key});

  @override
  ConsumerState<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(productsProvider.notifier).getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: Text(
          'Products',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: productsState.isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.deepPurple))
                : productsState.errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      "oop's Something went wrong!",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: productsState.productsModel.products?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = productsState.productsModel.products?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProductsDetailView.id, arguments: product?.id);
                        },
                        child: Container(
                          color: Colors.white,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 21),
                                child: Column(
                                  children: [
                                    if ((product?.images?.isNotEmpty ?? false))
                                      CachedNetworkImage(
                                        imageUrl: product!.images![0],
                                        placeholder: (context, url) => CustomShimmer(width: 84, height: 84, radius: 12),
                                        errorWidget: (context, url, error) => Icon(Icons.photo),
                                        width: 84,
                                        height: 84,
                                      ),
                                    Spacer(),
                                    Text(
                                      '\$ ${product?.price?.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    SizedBox(height: 0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: Text(
                                        product?.title ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        product?.description ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 11),
                                    Divider(color: Colors.grey[300], height: 0),
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 45,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.shopping_bag_outlined, color: Colors.deepPurple),
                                              SizedBox(width: 10),
                                              Text(
                                                'Add to cart',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
