import 'package:calca/data/repositories/calculator_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Calculator logic test', () {
    final repo = CalculatorRepositoryImpl();
    
    expect(repo.calculate('1+1'), '2');
    expect(repo.calculate('1+2-1'), '2');
    expect(repo.calculate('10-5+3'), '8');
    expect(repo.calculate('1.5+2.5'), '4');
    expect(repo.calculate('10+20+30-40'), '20');
  });
}