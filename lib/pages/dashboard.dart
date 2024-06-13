import 'package:flutter/material.dart';
import 'package:myapp/menus/add_page.dart';
import 'package:myapp/menus/category_page.dart';
import 'package:myapp/menus/graph_page.dart';
import 'package:myapp/menus/home_page.dart';
import 'package:myapp/menus/notification_page.dart';
import 'package:myapp/widget/custom_bottom_bar.dart';
import 'package:myapp/widget/cutsom_fab.dart';

final ValueNotifier<Widget> currentScreenNotifier = ValueNotifier<Widget>(const HomePage());

List<Widget> mainScreens = [
  const HomePage(),
  const GraphPage(),
  const AddPage(),
  const CategoryPage(),
  const NotificationPage(),
];
  
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void _onPressionTab(int index) => currentScreenNotifier.value = mainScreens[index];
  
  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder<Widget>(
      valueListenable: currentScreenNotifier,
      builder: (context, currentScreen, _) {
        return Scaffold(
          body: currentScreen,
          floatingActionButton: CustomFab(onPressed: () => currentScreenNotifier.value = const AddPage()),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomBar(onPressed: _onPressionTab),
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}


void changeScreen(Widget newScreen) {
  currentScreenNotifier.value = newScreen;
}