import 'package:flutter/material.dart';
import 'package:myapp/pages/dashboard.dart';
import 'package:myapp/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _rememberMe = false;

  void onChangeRememberme(value) => setState(() => _rememberMe = value);

  void _dashborad() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));

  void _login() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'image/register-icon.png',
                  height: 280,
                ),
                const SizedBox(height: 20),
                _myText('Register', const Color(0xFF4CAF50), 28, FontWeight.bold),
                const SizedBox(height: 8),
                _myText('Register to login.', Colors.grey, 16, FontWeight.normal),
                const SizedBox(height: 20),
                _myFormInput('Username', false, const Icon(Icons.person)),
                const SizedBox(height: 16),
                _myFormInput('Mobile Number', false, const Icon(Icons.phone)),
                const SizedBox(height: 16),
                _myFormInput('Password', true, const Icon(Icons.lock)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: _rememberMe, onChanged: onChangeRememberme),
                    _myText('Reminder me anytime', Colors.black, 16, FontWeight.w300)
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _dashborad,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                  child: _myText('Sign Up', Colors.white, 16, FontWeight.bold)
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: _login,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _myText('Already have an account? ', const Color(0xFF727272), 16, FontWeight.normal),
                      _myText(' Sign In', const Color(0xFF727272), 16, FontWeight.bold)
                    ],
                  )
                ),
              ],
            ),
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

  Widget _myFormInput(String text, bool isPassword, Icon icon){
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: false,
        fillColor: const Color(0xFF9A9797),
        prefixIcon: icon,
        suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
        hintText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          fontFamily: 'Monserrat',
          color: Color(0xFF858080),
        )
      ),
    );
  }
}