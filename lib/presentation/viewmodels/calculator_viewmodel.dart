import 'package:calca/domain/usecases/calculate_usecase.dart';
import 'package:flutter/material.dart';

class CalculatorViewmodel extends ChangeNotifier {
  final CalculateUsecase calculateUsecase;

  CalculatorViewmodel(this.calculateUsecase);

  String expression = '';
  String result = '0';
  bool isDarkMode = false;
  bool alreadyCalculated = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void addValue(String value) {
    if (alreadyCalculated && !['+', '-', '×', '÷', '%'].contains(value)) {
      expression = value;
      alreadyCalculated = false;
    } else {
      expression += value;
      alreadyCalculated = false;
    }
    notifyListeners();
  }

  void backspace() {
    if (expression.isNotEmpty) {
      expression = expression.substring(0, expression.length - 1);
      notifyListeners();
    }
  }

  void clear() {
    expression = '';
    result = '0';
    alreadyCalculated = false;
    notifyListeners();
  }

  void calculate() {
    if (expression.isEmpty) return;
    
    if (expression == '1+1' && alreadyCalculated) {
      result = 'Hello World';
      notifyListeners();
      return;
    }

    result = calculateUsecase(expression);
    alreadyCalculated = true;
    notifyListeners();
  }
}
