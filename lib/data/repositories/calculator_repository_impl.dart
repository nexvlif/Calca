import 'package:calca/domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  String calculate(String expression) {
    try {
      if (expression.isEmpty) return '0';

      String mathExpr = expression.replaceAll('×', '*').replaceAll('÷', '/');

      final regExp = RegExp(r'(\d+\.?\d*)|([+\-*/])');
      final tokens = regExp
          .allMatches(mathExpr)
          .map((m) => m.group(0)!)
          .toList();

      if (tokens.isEmpty) return '0';

      List<String> pass1 = [];
      for (int i = 0; i < tokens.length; i++) {
        String token = tokens[i];
        if (token == '*' || token == '/') {
          if (pass1.isEmpty || i + 1 >= tokens.length) return 'Error';
          double left = double.parse(pass1.removeLast());
          double right = double.parse(tokens[++i]);
          double result = (token == '*') ? (left * right) : (left / right);
          pass1.add(result.toString());
        } else {
          pass1.add(token);
        }
      }

      if (pass1.isEmpty) return '0';
      double total = double.parse(pass1[0]);
      for (int i = 1; i < pass1.length; i += 2) {
        if (i + 1 >= pass1.length) break;
        String op = pass1[i];
        double value = double.parse(pass1[i + 1]);
        if (op == '+') {
          total += value;
        } else if (op == '-') {
          total -= value;
        }
      }

      if (total.isInfinite || total.isNaN) return 'Error';

      if (total == total.toInt()) {
        return total.toInt().toString();
      }

      String result = total.toString();
      if (result.contains('.') && result.length > 10) {
        result = total.toStringAsFixed(4);
        while (result.endsWith('0')) {
          result = result.substring(0, result.length - 1);
        }
        if (result.endsWith('.')) {
          result = result.substring(0, result.length - 1);
        }
      }

      return result;
    } catch (e) {
      return 'Error';
    }
  }
}
