import 'package:flutter/material.dart';
import 'package:myapp/pages/dashboard.dart';
import 'package:myapp/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

  void onChangeRememberme(value) => setState(() => _rememberMe = value);

  void _dashborad() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));

  void _register() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'image/login-icon.png',
                  height: 280,
                ),
                _myText('Login', const Color(0xFF6DBA70), 32, FontWeight.w700),
                const SizedBox(height: 8),
                _myText('Login to continue.', const Color(0xFF727272), 20, FontWeight.w300),
                const SizedBox(height: 20),
                _myFormInput('Username', false, const Icon(Icons.person)),
                const SizedBox(height: 16),
                _myFormInput('Password', true, const Icon(Icons.lock)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _myText('Reminder me anytime', const Color(0xFF727272), 16, FontWeight.w300),
                    Switch(value: _rememberMe, onChanged: onChangeRememberme)
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: _dashborad,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAEE2B0),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)
                      )
                    ),
                    child: _myText('Sign In', Colors.black, 20, FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: _register,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _myText('Don\'t have any account? ', const Color(0xFF727272), 16, FontWeight.normal),
                        _myText(' Sign Up', const Color(0xFF727272), 16, FontWeight.bold)
                      ],
                    )
                  ),
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