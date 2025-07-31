import 'package:flutter/material.dart';
import 'package:future_provider/presentation/posts/posts_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PostsView.id:
        return MaterialPageRoute(builder: (_) => PostsView());
      default:
        return error();
    }
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(appBar: AppBar(title: Text('Error'), centerTitle: true));
      },
    );
  }
}
