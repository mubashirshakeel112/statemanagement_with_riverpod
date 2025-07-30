import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier_provider/presentation/favourite/favourite_view.dart';
import 'package:state_notifier_provider/presentation/products/products_view.dart';

class RouteGenerator{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case ProductsView.id:
        return MaterialPageRoute(builder: (_)=> ProductsView());
      case FavouriteView.id:
        return MaterialPageRoute(builder: (_)=> FavouriteView());
      default:
        return error();
    }
  }

  static Route<dynamic> error(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Error'
          ),
        ),
      );
    });
  }
}