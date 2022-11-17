import 'dart:math';
import 'package:calculator_bmi/resources/text_styles.dart';
import 'package:calculator_bmi/resources/mini_container.dart';
import 'package:flutter/material.dart';

class ImperialScreen extends StatefulWidget {
  const ImperialScreen({super.key});

  @override
  State<ImperialScreen> createState() => _ImperialScreenState();
}

class _ImperialScreenState extends State<ImperialScreen> {
  int height = 70;
  int weight = 205;

  double calculateBmi(int weight, int height) {
    double bmi = (weight * 703) / pow(height, 2);
    return bmi;
  }

  String getInterpretation(double bmi) {
    if (bmi < 16) {
      return 'Wygłodzenie';
    }
    if (bmi < 17) {
      return 'Wychudzenie';
    }
    if (bmi < 18.5) {
      return 'Niedowaga';
    }
    if (bmi < 25) {
      return 'Waga prawidłowa';
    }
    if (bmi < 30) {
      return 'Nadwaga';
    }
    if (bmi < 35) {
      return 'Otyłość I stopnia';
    }
    if (bmi < 40) {
      return 'Otyłość II stopnia';
    }

    return 'Otyłość III stopnia';
  }

  @override
  Widget build(BuildContext context) {
    var result = calculateBmi(weight, height);
    var resultDetail = getInterpretation(result);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MiniContainer(
              boxColor: Colors.white,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'WZROST',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      const Text(
                        'in',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 90,
                    activeColor: Colors.green,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          height = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MiniContainer(
              boxColor: Colors.white,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'WAGA',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        weight.toString(),
                        style: textStyle2,
                      ),
                      const Text(
                        'lb',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: weight.toDouble(),
                    min: 80,
                    max: 330,
                    activeColor: Colors.green,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          weight = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MiniContainer(
                    boxColor: Colors.white,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'TWOJE BMI',
                          style: textStyle1,
                        ),
                        Text(
                          result.toStringAsFixed(1),
                          style: textStyle2,
                        ),
                        Text(
                          resultDetail,
                          style: textStyle1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
