import 'package:calca/domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  String calculate(String expression) {
    try {
      final regExp = RegExp(r'(\d+\.?\d*)|([+-])');
      final matches = regExp.allMatches(expression);

      if (matches.isEmpty) return '0';

      double total = 0;
      String currentOp = '+';

      for (final match in matches) {
        final token = match.group(0)!;

        if (token == '+' || token == '-') {
          currentOp = token;
        } else {
          final value = double.parse(token);
          if (currentOp == '+') {
            total += value;
          } else if (currentOp == '-') {
            total -= value;
          }
        }
      }

      if (total == total.toInt()) {
        return total.toInt().toString();
      }
      return total.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
