import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                    _myText('See Your Categories Expense Here',Colors.black, 20, FontWeight.bold),
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
                children: [
                  const SizedBox(height: 20),
                  _buildOption('Food', "20%", "-Rp. 150.000"),
                  _buildOption('Daily Use', "35%", "-Rp. 300.000"),
                  _buildOption('Saving', "10%", "-Rp. 50.000"),
                  _buildOption('Transport', "15%", "-Rp. 50.000"),
                  _buildOption('Education', "20%", "-Rp. 50.000"),
                  _buildOption('Pet', "0%", "-Rp. 0")
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

  Widget _buildOption(String title, String subtitle, String amount) {
    return Container(
      height: 80,
      width: 300,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromRGBO(204, 244, 205, 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _myText(title, Colors.black, 16, FontWeight.bold),
                    _myText(subtitle, Colors.grey, 14, FontWeight.normal),
                  ],
                ),
              ],
            ),
          ),
          _myText(amount, Colors.red, 14, FontWeight.normal)
        ],
      ),
    );
  }
}