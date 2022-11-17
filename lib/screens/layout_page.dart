import 'package:calculator_bmi/screens/imperial_screen.dart';
import 'package:calculator_bmi/screens/metrical_screen.dart';
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
            return const MetricalScreen();
          } else {
            return const ImperialScreen();
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
