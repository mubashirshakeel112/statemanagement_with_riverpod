import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_advance/presentation/products/products_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ProductsView.id:
        return MaterialPageRoute(builder: (_) => ProductsView());
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
