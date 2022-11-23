abstract class Units {
  double toMetricHeight(double height);
  double toMetricWeight(double weight);
  double fromMetricHeight(double height);
  double fromMetricWeight(double weight);
  String getHeightUnitName();
  String getWeightUnitName();
}

class MetricUnits extends Units {
  @override
  double toMetricHeight(double height) {
    return height;
  }

  @override
  double fromMetricHeight(double height) {
    return height;
  }

  @override
  double toMetricWeight(double weight) {
    return weight;
  }

  @override
  double fromMetricWeight(double weight) {
    return weight;
  }

  @override
  String getHeightUnitName() {
    return 'cm';
  }

  @override
  String getWeightUnitName() {
    return 'kg';
  }
}

class ImperialUnits extends Units {
  @override
  double toMetricHeight(double height) {
    return height * 2.54;
  }

  @override
  double fromMetricHeight(double height) {
    return height / 2.54;
  }

  @override
  double toMetricWeight(double weight) {
    return weight * 0.453592;
  }

  @override
  double fromMetricWeight(double weight) {
    return weight / 0.453592;
  }

  @override
  String getHeightUnitName() {
    return 'in';
  }

  @override
  String getWeightUnitName() {
    return 'lb';
  }
}
