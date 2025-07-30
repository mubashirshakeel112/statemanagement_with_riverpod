import 'package:flutter/material.dart';
import 'package:state_provider/presentation/home/home_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return error();
    }
  }
  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(appBar: AppBar(title: Text('Error')));
      },
    );
  }
}
