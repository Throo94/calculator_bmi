import 'package:calculator_bmi/resources/text_styles.dart';
import 'package:calculator_bmi/resources/mini_container.dart';
import 'package:calculator_bmi/screens/bmi_screen/cubit/bmi_cubit.dart';
import 'package:calculator_bmi/utils/bmi_calculator.dart';
import 'package:calculator_bmi/utils/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key, required this.units});

  final Units units;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BMICubit(),
      child: BlocBuilder<BMICubit, BMIState>(
        builder: (context, state) {
          var result = BmiCalculator.calculateBmi(state.weight, state.height);
          var resultDetail = BmiCalculator.getInterpretation(result);
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
                              units
                                  .fromMetricHeight(state.height)
                                  .toStringAsFixed(0),
                              style: textStyle2,
                            ),
                            Text(
                              units.getHeightUnitName(),
                              style: textStyle1,
                            ),
                          ],
                        ),
                        Slider(
                          value: state.height,
                          min: 120,
                          max: 220,
                          activeColor: Colors.green,
                          onChanged: (double newValue) {
                            BlocProvider.of<BMICubit>(context)
                                .onHeightChanged(state, newValue);
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
                              units
                                  .fromMetricWeight(state.weight)
                                  .toStringAsFixed(0),
                              style: textStyle2,
                            ),
                            Text(
                              units.getWeightUnitName(),
                              style: textStyle1,
                            ),
                          ],
                        ),
                        Slider(
                          value: state.weight,
                          min: 40,
                          max: 160,
                          activeColor: Colors.green,
                          onChanged: (double newValue) {
                            BlocProvider.of<BMICubit>(context)
                                .onWeightChanged(state, newValue);
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
        },
      ),
    );
  }
}
