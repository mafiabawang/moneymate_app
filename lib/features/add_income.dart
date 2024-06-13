import 'package:flutter/material.dart';
import 'package:myapp/menus/add_page.dart';
import 'package:myapp/pages/dashboard.dart';

class AddIncome extends StatelessWidget {
  const AddIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFCCF4CD), 
        width: MediaQuery.of(context).size.width, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "image/income.png",
                      width: 80,
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (){
                          changeScreen(const AddPage());
                        },
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      _myText('Add your income!', Colors.black, 20, FontWeight.bold)
                    ],
                  ),
                  const SizedBox(height: 20),
                  _myLabelInput('Source of income'),
                  const SizedBox(height: 10),
                  _myFormInput('   Enter your income', TextInputType.text),
                  const SizedBox(height: 20),
                  _myLabelInput('Amount of income'),
                  const SizedBox(height: 10),
                  _myFormInput('  Rp', TextInputType.number),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _myButtonInput('Discard', const Color.fromRGBO(240, 165, 165, 1), 5, const AddPage()),
                      _myButtonInput('Save', const Color.fromRGBO(204, 244, 205, 1), 20, const AddPage()),
                    ],
                  ),
                ],
              ),
            ),
          ],
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

  Widget _myButtonInput(String text, Color color, double padright, Widget nextPage) {
    return Padding(
      padding: EdgeInsets.only(right: padright),
      child: GestureDetector(
        onTap: (){
          changeScreen(nextPage);
        },
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