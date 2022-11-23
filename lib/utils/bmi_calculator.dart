import 'dart:math';

class BmiCalculator {

  static double calculateBmi(double weight, double height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  static String getInterpretation(double bmi) {
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

  
}