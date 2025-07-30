import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_provider/presentation/products/notifier/product_notifier.dart';

class FavouriteView extends StatelessWidget {
  static const String id = '/favourite_view';

  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, weight: 900, color: Colors.white,),
        ),
        title: Text(
          'Favourite',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final product = ref.watch(favouriteProvider);
          return ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(product[index].name), subtitle: Text(product[index].price.toString()));
            },
          );
        },
      ),
    );
  }
}
