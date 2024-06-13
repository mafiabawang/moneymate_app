import 'package:flutter/material.dart';
import 'package:myapp/features/add_categories.dart';
import 'package:myapp/menus/add_page.dart';
import 'package:myapp/pages/dashboard.dart';

class TrackExpenses extends StatelessWidget {
  const TrackExpenses({super.key});

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
                      "image/expense.png",
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
                      _myText('Track Your Expenses', Colors.black, 20, FontWeight.bold)
                    ],
                  ),
                  const SizedBox(height: 20),
                  _myLabelInput('Name of Need', FontWeight.normal),
                  const SizedBox(height: 10),
                  _myFormInput('   Enter your need', TextInputType.text),
                  const SizedBox(height: 20),
                  _myLabelInput('Amount of expenses', FontWeight.normal),
                  const SizedBox(height: 10),
                  _myFormInput('  Rp', TextInputType.number),
                  const SizedBox(height: 25),
                  _myLabelInput('Select Your Expenses Category', FontWeight.bold),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _myContainerCategory('Food', const Color.fromRGBO(226, 167, 253, 1)),
                      ),
                      const SizedBox(width: 10),
                      _myContainerCategory('Daily Life', const Color.fromRGBO(253, 167, 167, 1))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _myContainerCategory('Transport', const Color.fromRGBO(155, 235, 255, 1)),
                      ),
                      const SizedBox(width: 10),
                      _myContainerCategory('Education', const Color.fromRGBO(136, 248, 174, 1))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _myContainerCategory('Saving', const Color.fromRGBO(240, 168, 135, 1)),
                      ),
                      const SizedBox(width: 10),
                      _myContainerCategory('Pet', const Color.fromRGBO(251, 253, 123, 1))
                    ],
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _myButtonInput('Add Category', const Color.fromRGBO(13, 129, 18, 1), 35, const AddCategories()),
                      _myButtonInput('Discard', const Color.fromRGBO(240, 165, 165, 1), 5, const AddPage()),
                      _myButtonInput('Save', const Color.fromRGBO(204, 244, 205, 1), 20, const AddPage()),
                    ],
                  )
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

  Widget _myLabelInput(String text, FontWeight weight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: _myText(text, Colors.black, 15, weight),
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
          width: 90,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: color,
          ),
          child: Center(
            child: _myText(text, Colors.black, 11, FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _myContainerCategory(String text, Color color){
    return Container(
      height: 30,
      width: 145,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: color,
      ),
      child: Center(
        child: _myText(text, Colors.black, 12, FontWeight.w600),
      ),
    );
  }
}