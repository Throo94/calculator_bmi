import 'package:calculator_bmi/screens/bmi_screen/bmi_screen.dart';
import 'package:calculator_bmi/utils/units.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return BMIScreen(
              units: MetricUnits(),
            );
          } else {
            return BMIScreen(
              units: ImperialUnits(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Metryczny',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Imperialny',
          ),
        ],
      ),
    );
  }
}
