import 'package:flutter/material.dart';
import 'package:myapp/features/edit_profile.dart';
import 'package:myapp/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    void back() => Navigator.pop(context);

    void login() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

    void editProfile() => Navigator.push(context,MaterialPageRoute(builder: (context) => const EditProfile()));

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFCCF4CD), 
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => back(),
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      _myText('My Profile ', Colors.black, 20, FontWeight.bold),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20.0),  
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: _buildProfileAvatar(),
                        ),                        
                        const SizedBox(width: 10),
                        _myButtonInput(
                          'Edit', 
                          const Color(0xFFCCF4CD),
                          20, 
                          () {
                            editProfile();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _myLabelInput('Full Name'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    const SizedBox(height: 20),
                    _myLabelInput('Email Address'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    const SizedBox(height: 20),
                    _myLabelInput('Phone'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    const SizedBox(height: 20),
                    _myLabelInput('Gender'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    const SizedBox(height: 20),
                    _myLabelInput('Education'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    const SizedBox(height: 20),
                    _myLabelInput('Job'),
                    const SizedBox(height: 10),
                    _myFormInput('John Doe'),
                    TextButton(
                      onPressed: (){
                        login();
                      }, 
                      child: _myText('Sign Out', Colors.red, 14, FontWeight.bold),
                    ),
                  ],
                ),
              )
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

  Widget _myLabelInput(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: _myText(text, Colors.black, 15, FontWeight.normal),
        )
      ],
    );
  }

  Widget _myFormInput(String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: value,
            readOnly: true, // Set to true to disable editing
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
            ),
          ),
        ),
      ),
    ]
  );
}

  Widget _buildProfileAvatar() {
    return Container(
      width: 128,
      height: 128,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color:Color(0xFFCCF4CD),
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 64,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _myButtonInput(String text, Color color, double padright, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.only(right: padright),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 25,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: color,
          ),
          child: Center(
            child: _myText(text, Colors.black, 12, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}