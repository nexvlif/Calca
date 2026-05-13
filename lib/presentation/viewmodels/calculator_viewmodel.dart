import 'package:calca/domain/usecases/calculate_usecase.dart';
import 'package:flutter/material.dart';

class CalculatorViewmodel extends ChangeNotifier {
  final CalculateUsecase calculateUsecase;

  CalculatorViewmodel(this.calculateUsecase);

  String expression = '';
  String result = '0';
  bool isOnePlusOne = false;
  bool alreadyCalculated = false;

  void addValue(String value) {
    expression += value;
    notifyListeners();
  }

  void clear() {
    expression = '';
    result = '0';
    alreadyCalculated = false;
    notifyListeners();
  }

  void calculate() {
    if (expression == '1+1' && alreadyCalculated) {
      result = 'Hello World';
      notifyListeners();
      return;
    }

    result = calculateUsecase(expression);

    if (expression == '1+1') {
      alreadyCalculated = true;
    } else {
      alreadyCalculated = false;
    }
    notifyListeners();
  }
}
