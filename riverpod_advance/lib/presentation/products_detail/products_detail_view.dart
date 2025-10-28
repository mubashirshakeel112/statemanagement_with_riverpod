import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_advance/presentation/products_detail/notifier/products_detail_notifier.dart';
import 'package:riverpod_advance/widgets/custom_shimmer.dart';

class ProductsDetailView extends ConsumerStatefulWidget {
  static const String id = '/products_detail_view';

  final int productId;

  const ProductsDetailView({super.key, required this.productId});

  @override
  ConsumerState<ProductsDetailView> createState() => _ProductsDetailViewState();
}

class _ProductsDetailViewState extends ConsumerState<ProductsDetailView> {
  @override
  void initState() {
    Future.microtask((){
      ref.read(productsDetailProvider.notifier).getProductsById(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsDetailState = ref.watch(productsDetailProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text(
          'Products Detail',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: productsDetailState.isLoading ? Center(child: CircularProgressIndicator(color: Colors.deepPurple,),) : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white70),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: productsDetailState.product.images?[0] ?? '',
                placeholder: (context, url) => Center(child: CustomShimmer(width: 200, height: 200, radius: 12)),
                errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 100),
              ),
            ),
            SizedBox(height: 20),
            Text(
              productsDetailState.product.title ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              productsDetailState.product.description ?? '',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$ ${productsDetailState.product.price}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(height: 2),
            Text(
              'Rating: ${productsDetailState.product.rating}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            SizedBox(height: 20),
            MaterialButton(
              minWidth: double.infinity,
              height: 70,
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Bookmark',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
