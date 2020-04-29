import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String comments() {
    if (_bmi >= 25) {
      return 'You have a higher BMI. Exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal BMI. ';
    } else {
      return 'You have a lower BMI. Eat more';
    }
  }
}
