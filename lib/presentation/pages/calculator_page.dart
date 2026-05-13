import 'package:calca/presentation/viewmodels/calculator_viewmodel.dart';
import 'package:calca/presentation/widgets/calc_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalculatorViewmodel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Calca')),

      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(vm.expression, style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 12),

                  Text(
                    vm.result,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              CalcButton(text: 'C', onTap: () => vm.clear()),
              CalcButton(text: '1', onTap: () => vm.addValue('1')),
              CalcButton(text: '2', onTap: () => vm.addValue('2')),
            ],
          ),
          Row(
            children: [
              CalcButton(text: '+', onTap: () => vm.addValue('+')),
              CalcButton(text: '-', onTap: () => vm.addValue('-')),
              CalcButton(text: '=', onTap: () => vm.calculate()),
            ],
          ),
        ],
      ),
    );
  }
}
