import 'package:flutter/material.dart';
import 'package:myapp/features/set_planning.dart';
import 'package:myapp/pages/dashboard.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

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
                    _myText('Hey, Your Name',Colors.black, 16, FontWeight.normal),
                    _myText('Add Category Here',Colors.black, 20, FontWeight.bold),
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
                          changeScreen(const SetPlanning());
                        },
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      _myText('Add your new category ', Colors.black, 20, FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.edit, size: 50, color: Colors.grey),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _myLabelInput('Name Of Category'),
                            const SizedBox(height: 10),
                            _myFormInput(TextInputType.text, false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _myLabelInput('Category fund allocation as a percentage'),
                  const SizedBox(height: 10),
                  _myFormInput(TextInputType.number, true),
                  const SizedBox(height: 15),
                  _myLabelInput('Set your category color'),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            _buildColorOption(Colors.pink),
                            _buildColorOption(Colors.red),
                            _buildColorOption(Colors.orange),
                            _buildColorOption(Colors.yellow),
                            _buildColorOption(Colors.green),
                            _buildColorOption(Colors.blue),
                            _buildColorOption(Colors.indigo),
                            _buildColorOption(Colors.purple),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _myButtonInput('Discard', const Color.fromRGBO(240, 165, 165, 1), 5, const SetPlanning()),
                      _myButtonInput('Save', const Color.fromRGBO(204, 244, 205, 1), 20, const SetPlanning()),
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

  Widget _myFormInput(TextInputType type, bool icon){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: type,
              decoration: InputDecoration(
                suffixIcon: icon ? const Icon(Icons.percent_outlined) : null,
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
        )
      ]
    );
  }

  Widget _buildColorOption(Color color){
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
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