import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final ValueChanged<int> onPressed;
  
  const CustomBottomBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFCCF4CD),
      shape: const CircularNotchedRectangle(),
      notchMargin: 15,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _myButton(Icons.home_outlined, 'Home', () => onPressed(0)),
                _myButton(Icons.bar_chart_outlined, 'Graph', () => onPressed(1)),
              ],
            ),
            const SizedBox(width: 70),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _myButton(Icons.category_outlined, 'Category', () => onPressed(3)),
                _myButton(Icons.notifications_outlined, 'Notify', () => onPressed(4)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myButton(IconData icon, String text, VoidCallback onPressed) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Monserrat',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}