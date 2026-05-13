import 'package:calca/core/theme/app_theme.dart';
import 'package:calca/presentation/viewmodels/calculator_viewmodel.dart';
import 'package:calca/presentation/widgets/calc_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalculatorViewmodel>();
    final isDark = vm.isDarkMode;

    final Color scaffoldBg = isDark ? AppTheme.darkScaffoldBg : AppTheme.lightScaffoldBg;
    final Color displayTextColor = isDark ? AppTheme.darkDisplayTextColor : AppTheme.lightDisplayTextColor;
    final Color secondaryTextColor = isDark ? AppTheme.darkSecondaryTextColor : AppTheme.lightSecondaryTextColor;
    final Color buttonBg = isDark ? AppTheme.darkButtonBg : AppTheme.lightButtonBg;
    final Color iconColor = isDark ? AppTheme.darkIconColor : AppTheme.lightIconColor;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppTheme.operatorColor),
                    onPressed: () => vm.toggleTheme(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: buttonBg,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildModeIcon(Icons.edit_outlined, false, isDark),
                        _buildModeIcon(Icons.calculate_outlined, false, isDark),
                        _buildModeIcon(Icons.apps_rounded, true, isDark, label: 'Basic'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      vm.expression.isEmpty ? ' ' : vm.expression,
                      style: TextStyle(
                        fontSize: 32,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      vm.result,
                      style: TextStyle(
                        fontSize: 64,
                        color: displayTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.history, color: iconColor, size: 20),
                  const SizedBox(width: 16),
                  Icon(Icons.mic_none_rounded, color: iconColor, size: 20),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.backspace_outlined, color: iconColor, size: 20),
                    onPressed: () => vm.backspace(),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 1, 
                color: isDark ? Colors.white10 : Colors.black12,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CalcButton(
                        text: 'C',
                        textColor: AppTheme.clearColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.clear(),
                      ),
                      CalcButton(
                        text: '()',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () {},
                      ),
                      CalcButton(
                        text: '%',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.addValue('%'),
                      ),
                      CalcButton(
                        text: '÷',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.addValue('÷'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalcButton(text: '7', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('7')),
                      CalcButton(text: '8', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('8')),
                      CalcButton(text: '9', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('9')),
                      CalcButton(
                        text: '×',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.addValue('×'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalcButton(text: '4', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('4')),
                      CalcButton(text: '5', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('5')),
                      CalcButton(text: '6', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('6')),
                      CalcButton(
                        text: '-',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.addValue('-'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalcButton(text: '1', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('1')),
                      CalcButton(text: '2', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('2')),
                      CalcButton(text: '3', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('3')),
                      CalcButton(
                        text: '+',
                        textColor: AppTheme.operatorColor,
                        backgroundColor: buttonBg,
                        onTap: () => vm.addValue('+'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalcButton(
                        text: '',
                        icon: Icons.calculate_rounded,
                        textColor: displayTextColor,
                        backgroundColor: buttonBg,
                        onTap: () {},
                      ),
                      CalcButton(text: '0', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('0')),
                      CalcButton(text: '.', backgroundColor: buttonBg, textColor: displayTextColor, onTap: () => vm.addValue('.')),
                      CalcButton(
                        text: '=',
                        backgroundColor: AppTheme.equalBgColor,
                        textColor: Colors.white,
                        onTap: () => vm.calculate(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeIcon(IconData icon, bool isActive, bool isDark, {String? label}) {
    final Color activeBg = isDark ? AppTheme.darkModeIconActiveBg : AppTheme.lightModeIconActiveBg;
    final Color activeIcon = isDark ? Colors.white : Colors.black;
    final Color inactiveIcon = isDark ? Colors.white38 : Colors.black38;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? activeBg : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: isActive ? activeIcon : inactiveIcon),
          if (label != null) ...[
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? activeIcon : inactiveIcon,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
