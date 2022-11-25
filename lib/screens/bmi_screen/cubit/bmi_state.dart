part of 'bmi_cubit.dart';


@immutable
class BMIState {
  const BMIState(
      {required this.height,
      required this.weight,
      required this.bmi,
      required this.description});

  final double height;
  final double weight;
  final double bmi;
  final String description;

  
}
