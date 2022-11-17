import 'dart:math';
import 'package:calculator_bmi/resources/text_styles.dart';
import 'package:calculator_bmi/resources/mini_container.dart';
import 'package:flutter/material.dart';

class MetricalScreen extends StatefulWidget {
  const MetricalScreen({super.key});

  @override
  State<MetricalScreen> createState() => _MetricalScreenState();
}

class _MetricalScreenState extends State<MetricalScreen> {
  int height = 170;
  int weight = 100;

  double calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
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
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
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
                        'kg',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: weight.toDouble(),
                    min: 40,
                    max: 160,
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
