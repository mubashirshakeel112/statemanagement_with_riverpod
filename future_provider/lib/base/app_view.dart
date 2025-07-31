import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/presentation/posts/posts_view.dart';
import 'package:future_provider/route_generator.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: PostsView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
