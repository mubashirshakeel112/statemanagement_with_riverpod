import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_advance/presentation/home/home_view.dart';
import 'package:riverpod_advance/presentation/login/login_view.dart';
import 'package:riverpod_advance/presentation/products/products_view.dart';
import 'package:riverpod_advance/route_generator.dart';
import 'package:riverpod_advance/utils/helpers/global_keys.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: LoginView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey[100]),
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
