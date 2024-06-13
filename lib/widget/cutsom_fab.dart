import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  final VoidCallback onPressed;
  
  const CustomFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xFF6DBA70),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}