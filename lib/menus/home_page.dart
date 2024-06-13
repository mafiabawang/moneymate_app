import 'package:flutter/material.dart';
import 'package:myapp/menus/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    _myText('Hello Good Morning', Colors.black, 20, FontWeight.bold),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfilePage()));
                          },
                          icon: const Icon(Icons.edit, color: Colors.green),
                        ),
                        _myText('Your Name', Colors.black, 16, FontWeight.normal),
                      ],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _myText('Welcome Back to Your Dashboard!',Colors.black, 18, FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _savingsCard(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _myText('Monthly Budget', Colors.black, 18, FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _myBudgetItem('Food', 45000, 75000, Icons.fastfood, Colors.pink[100]!),
                  _myBudgetItem('Transport', 30000, 100000, Icons.directions_car, Colors.blue[100]!),
                  _myBudgetItem('Education', 30000, 50000, Icons.school, Colors.green[100]!),
                  _myBudgetItem('Daily Life', 30000, 70000, Icons.home, Colors.orange[100]!),
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
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }

  Widget _savingsCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myText('March Savings', Colors.black, 16, FontWeight.bold),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _myText('Earned', Colors.black, 14, FontWeight.normal),
                _myText('Rp100,000', Colors.black, 14, FontWeight.normal),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: 1.0,
              backgroundColor: Colors.grey[300],
              color: Colors.green[300],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _myText('Spent', Colors.black, 14, FontWeight.normal),
                _myText('Rp50,000', Colors.black, 14, FontWeight.normal),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[300],
              color: Colors.red[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myBudgetItem(String category, int spent, int total, IconData icon, Color color) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _myText(category, Colors.black, 16, FontWeight.bold),
                _myText('Total amount Rp$total', Colors.grey, 12, FontWeight.normal),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: spent / total,
                  backgroundColor: Colors.grey[300],
                  color: color,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _myText('Rp$spent', Colors.black, 14, FontWeight.bold),
        ],
      ),
    ),
  );
}

}