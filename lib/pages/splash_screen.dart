import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("image/splashscreen-icon.png"),
              const SizedBox(height: 30),
              _myText('Get Started on', const Color(0xFF727272), 20, FontWeight.w300),
              const SizedBox(height: 8),
              _myText('MoneyMate', const Color(0xFF6DBA70), 36, FontWeight.w800),
              const SizedBox(height: 10),
              _myText('Organizing Finance, Creating Balance.\nPlan Your Financial Future Wisely', const Color(0xFF727272), 13, FontWeight.w300),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAEE2B0),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: _myText('Let\'s Start', Colors.black, 20, FontWeight.w700)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myText(String text, Color color, double size, FontWeight weight) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Monserrat',
        fontWeight: weight,
        color: color,
      ),
    );
  }
}