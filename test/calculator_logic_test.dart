import 'package:calca/data/repositories/calculator_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator logic upgrade tests', () {
    final repo = CalculatorRepositoryImpl();

    test('Basic addition and subtraction', () {
      expect(repo.calculate('1+1'), '2');
      expect(repo.calculate('10-5+3'), '8');
    });

    test('Multiplication and Division visual symbols', () {
      expect(repo.calculate('2×3'), '6');
      expect(repo.calculate('10÷2'), '5');
    });

    test('Operator Precedence (MDAS)', () {
      expect(repo.calculate('2+3×4'), '14');
      expect(repo.calculate('10-4÷2'), '8');
      expect(repo.calculate('2×3+4×5'), '26');
    });

    test('Decimal handling', () {
      expect(repo.calculate('1.5×2'), '3');
      expect(repo.calculate('5÷2'), '2.5');
    });

    test('Error handling', () {
      expect(repo.calculate('10÷0'), 'Error');
    });
  });
}
