import 'package:flutter/material.dart';
import 'package:myapp/features/add_categories.dart';
import 'package:myapp/menus/add_page.dart';
import 'package:myapp/pages/dashboard.dart';
import 'package:myapp/widget/edit_category_dialog.dart';

class SetPlanning extends StatefulWidget {
  const SetPlanning({super.key});

  @override
  State<SetPlanning> createState() => _SetPlanningState();
}

class _SetPlanningState extends State<SetPlanning> {
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
                    _myText('Setting Your Plan Here',Colors.black, 20, FontWeight.bold),
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
                      _myText('Category List ', Colors.black, 20, FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _myLabelInput('Your Monthly Income'),
                  const SizedBox(height: 10),
                  _myFormInput('  Rp', TextInputType.text),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      _myButtonInput('Add Category', const Color.fromRGBO(13, 129, 18, 1), 5, const AddCategories())
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _myContainerCategory('Transport', const Color.fromRGBO(155, 235, 255, 1), "20%"),
                        const SizedBox(width: 10),
                        _myContainerCategory('Daily Life', const Color.fromRGBO(253, 167, 167, 1), "35%"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _myContainerCategory('Transport', const Color.fromRGBO(155, 235, 255, 1), "20%"),
                        const SizedBox(width: 10),
                        _myContainerCategory('Daily Life', const Color.fromRGBO(253, 167, 167, 1), "35%"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _myContainerCategory('Transport', const Color.fromRGBO(155, 235, 255, 1), "20%"),
                        const SizedBox(width: 10),
                        _myContainerCategory('Daily Life', const Color.fromRGBO(253, 167, 167, 1), "35%"),
                      ],
                    ),
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
                suffixIcon: const Icon(Icons.edit_outlined),
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
          width: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: color,
          ),
          child: Center(
            child: _myText(text, Colors.white, 12, FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _myContainerCategory(String text, Color color, String subtitle){
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return EditCategoryDialog(
              categoryName: text,
              categoryColor: color,
              categoryPercentage: subtitle
            );
          }
        );
      },
      child: Container(
        height: 50,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: color,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _myText(text, Colors.black, 14, FontWeight.w600),
                      _myText(subtitle, Colors.black, 12, FontWeight.normal),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
                child: Icon(
                Icons.edit_outlined,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}