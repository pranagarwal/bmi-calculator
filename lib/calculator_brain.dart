import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String gett() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'Your Body Weight is Higher than Normal. You should Exercise more';
    } else if (_bmi >= 18) {
      return 'Your Body Weight is Normal. Good Job!';
    } else {
      return 'Your Body Weight is Lower than Normal. You should Eat more';
    }
  }
}
