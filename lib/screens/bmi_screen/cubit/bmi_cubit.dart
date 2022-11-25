import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'bmi_state.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(getState(100, 170));

  static double calculateBmi(double weight, double height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  static String getDescription(double bmi) {
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

  static BMIState getState(double weight, double height) {
    var bmi = calculateBmi(weight, height);
    var description = getDescription(bmi);
    return BMIState(
        height: height, weight: weight, bmi: bmi, description: description);
  }

  void onHeightChanged(double height) {
    emit(getState(state.weight, height));
  }

  void onWeightChanged(double weight) {
    emit(getState(weight, state.height));
  }
}
