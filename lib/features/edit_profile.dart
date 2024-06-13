import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    void back() => Navigator.pop(context);

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "image/income.png",
                        width: 80,
                      ),
                      _myText('Edit Your Profile\nHere', Colors.black, 24, FontWeight.w900, false),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => back(),
                          icon: const Icon(Icons.arrow_back_ios_outlined),
                        ),
                        _buildProfileAvatar(),
                        _myButtonInput('Save', const Color(0xFFCCF4CD), 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _myLabelInput('Full Name'),
                    const SizedBox(height: 10),
                    _myFormInput('   Enter your income', TextInputType.text),
                    const SizedBox(height: 20),
                    _myLabelInput('Email Address'),
                    const SizedBox(height: 10),
                    _myFormInput('  Rp', TextInputType.number),
                    const SizedBox(height: 20),
                    _myLabelInput('Phone'),
                    const SizedBox(height: 10),
                    _myFormInput('   Enter your income', TextInputType.text),
                    const SizedBox(height: 20),
                    _myLabelInput('Gender'),
                    const SizedBox(height: 10),
                    _myFormInput('  Rp', TextInputType.number),
                    const SizedBox(height: 20),
                    _myLabelInput('Education'),
                    const SizedBox(height: 10),
                    _myFormInput('   Enter your income', TextInputType.text),
                    const SizedBox(height: 20),
                    _myLabelInput('Job'),
                    const SizedBox(height: 10),
                    _myFormInput('  Rp', TextInputType.number),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _myText(String text, Color color, double size, FontWeight weight, bool align) {
    return Text(
      text,
      textAlign: align ? TextAlign.center : TextAlign.right,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Monserrat',
        fontWeight: weight,
        color: color,
      ),
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
          Icons.edit_square,
          size: 64,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _myButtonInput(String text, Color color, double padright) {
    return Padding(
      padding: EdgeInsets.only(right: padright),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          height: 25,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: color,
          ),
          child: Center(
            child: _myText(text, Colors.black, 12, FontWeight.w600, true),
          ),
        ),
      ),
    );
  }
  
  Widget _myLabelInput(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: _myText(text, Colors.black, 15, FontWeight.normal, true),
        )
      ],
    );
  }

  Widget _myFormInput(String text, TextInputType type){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: type,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 1),
                hintText: text,
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
}