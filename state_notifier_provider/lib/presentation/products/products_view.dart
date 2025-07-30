import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_provider/presentation/favourite/favourite_view.dart';
import 'package:state_notifier_provider/presentation/products/notifier/product_notifier.dart';

class ProductsView extends StatelessWidget {
  static const String id = '/products_view';

  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final products = ref.watch(productNotifier);
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 10),
                      title: Text(products[index].name),
                      subtitle: Text(products[index].price.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifier.notifier).decrement(index);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            products[index].quantity.toString(),
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifier.notifier).increment(index);
                            },
                            icon: Icon(Icons.add),
                          ),
                          Divider(),
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifier.notifier).removeProduct(index);
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifier.notifier).favourite(index);
                            },
                            icon: !products[index].favourite ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: MaterialButton(
              color: Colors.deepOrange,
              minWidth: double.infinity,
              height: 50,
              onPressed: (){
                Navigator.pushNamed(context, FavouriteView.id);
              }, child: Text('Favourite', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),),
          )
        ],
      ),
    );
  }
}
