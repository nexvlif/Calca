import 'package:calca/data/repositories/calculator_repository_impl.dart';
import 'package:calca/presentation/pages/calculator_page.dart';
import 'package:provider/provider.dart';
import 'package:calca/domain/usecases/calculate_usecase.dart';
import 'package:calca/presentation/viewmodels/calculator_viewmodel.dart';
import 'package:flutter/material.dart';

void main() {
  final repository = CalculatorRepositoryImpl();
  final useCase = CalculateUsecase(repository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorViewmodel(useCase),

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const CalculatorPage(),
    );
  }
}
