import 'package:flutter/material.dart';
import 'package:namoz_vaqtlari_uzb/ui/week/week_screen.dart';

import 'days/days_data_screen.dart';
import 'month/month_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> currentScreen = [];
  int currentIndex = 0;

  @override
  void initState() {
    currentScreen = [
       DaysDataScreen(),
      const WeekDataScreen(),
       MonthDataScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: currentScreen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(

            onTap: (v) {
              setState(() {
                 currentIndex = v;
              });
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'day'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'week'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'month'),
            ]),
      );

}
