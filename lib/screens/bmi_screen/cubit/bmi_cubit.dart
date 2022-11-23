import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(const BMIState(height: 170, weight: 100));

  void onHeightChanged(BMIState state, double height) {
    emit(BMIState(height: height, weight: state.weight));
  }
  void onWeightChanged(BMIState state, double weight) {
    emit(BMIState(height: state.height, weight: weight));
  }
}
