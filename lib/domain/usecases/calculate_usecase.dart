import 'package:calca/domain/repositories/calculator_repository.dart';

class CalculateUsecase {
  final CalculatorRepository repository;

  CalculateUsecase(this.repository);

  String call(String expression) {
    return repository.calculate(expression);
  }
}
