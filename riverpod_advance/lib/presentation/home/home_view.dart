import 'package:flutter/material.dart';
import 'package:riverpod_advance/presentation/carts/carts_view.dart';
import 'package:riverpod_advance/presentation/home/widgets/navbar_item.dart';
import 'package:riverpod_advance/presentation/products/products_view.dart';

class HomeView extends StatefulWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> pages = [ProductsView(), CartsView(), Center(), Center()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(duration: Duration(milliseconds: 200), child: pages[selectedIndex]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                    color: Colors.grey.withValues(alpha: 0.5),
                  ),
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(1, 0),
                    color: Colors.grey.withValues(alpha: 0.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavbarItems(
                    index: 0,
                    selectedIndex: selectedIndex,
                    filledIcon: Icons.home,
                    outlineIcon: Icons.home_outlined,
                    title: 'Home',
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  NavbarItems(
                    index: 1,
                    selectedIndex: selectedIndex,
                    filledIcon: Icons.shopping_bag,
                    outlineIcon: Icons.shopping_bag_outlined,
                    title: 'Cart',
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  NavbarItems(
                    index: 2,
                    selectedIndex: selectedIndex,
                    filledIcon: Icons.favorite,
                    outlineIcon: Icons.favorite_border,
                    title: 'Favourites',
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  NavbarItems(
                    index: 3,
                    selectedIndex: selectedIndex,
                    filledIcon: Icons.person,
                    outlineIcon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
