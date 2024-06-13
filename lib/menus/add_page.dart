import 'package:flutter/material.dart';
import 'package:myapp/features/add_income.dart';
import 'package:myapp/features/note_bills.dart';
import 'package:myapp/features/scan_receipt.dart';
import 'package:myapp/features/set_planning.dart';
import 'package:myapp/features/track_expenses.dart';
import 'package:myapp/pages/dashboard.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
                    _myText('Add Your Tracking Budget Here',Colors.black, 20, FontWeight.bold),
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
                  Image.asset(
                    'image/addbudget.png',
                    width: 180,
                  ),
                  const SizedBox(height: 14),
                  _buildOption(
                    "Set Your Planning",
                    "image/planning.png",
                    "Easy organize your financial categories with percentages",
                    const SetPlanning(),
                  ),
                  _buildOption(
                    "Scan Your Receipt",
                    "image/scan.png",
                    "Scan your receipts for easy expense tracking",
                    const ScanReceipt(),
                  ),
                  _buildOption(
                    "Note Your Bills",
                    "image/note.png",
                    "Easily record your monthly bills and set your reminders",
                    const NoteBills(),
                  ),
                  _buildOption(
                    "Add Your Income",
                    "image/income.png",
                    "Keep track of your income here",
                    const AddIncome(),
                  ),
                  _buildOption(
                    "Track Your Expenses",
                    "image/expense.png",
                    "Manually record your expenses by category",
                    const TrackExpenses(),
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

  Widget _buildOption(String title, String imagePath, String subtitle, Widget nextPage){
    return GestureDetector(
      onTap: (){
        changeScreen(nextPage);
      },
      child: Container(
        height: 80,
        width: 325,
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
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _myText(title, const Color.fromRGBO(61, 124, 64, 1), 20, FontWeight.bold),
                _myText(subtitle, Colors.grey, 10, FontWeight.normal),
              ],
            )
          ],
        ),
      ),
    );
  }
}
