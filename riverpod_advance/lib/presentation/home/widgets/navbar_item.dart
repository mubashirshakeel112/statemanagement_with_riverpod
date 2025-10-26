import 'package:flutter/material.dart';

class NavbarItems extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData filledIcon;
  final IconData outlineIcon;
  final String title;
  final Function()? onTap;
  const NavbarItems({super.key, required this.index, required this.selectedIndex, this.onTap, required this.filledIcon, required this.outlineIcon, required this.title,});

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? filledIcon : outlineIcon,
            color: isSelected ? Colors.deepPurple : Colors.grey,
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? Colors.deepPurple : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
