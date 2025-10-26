import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_advance/presentation/carts/carts_view.dart';
import 'package:riverpod_advance/presentation/home/home_view.dart';
import 'package:riverpod_advance/presentation/products/products_view.dart';
import 'package:riverpod_advance/presentation/products_detail/products_detail_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(builder: (_) => HomeView());
      case ProductsView.id:
        return MaterialPageRoute(builder: (_) => ProductsView());
      case CartsView.id:
        return MaterialPageRoute(builder: (_) => CartsView());
      case ProductsDetailView.id:
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_)=> ProductsDetailView(productId: args,));
      default:
        return _errorRoutes();
    }
  }

  static Route<dynamic> _errorRoutes() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'))),
    );
  }
}
