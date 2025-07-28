import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.icon, required this.bgColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.transparent
      ),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
