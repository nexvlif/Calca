import 'package:flutter/material.dart';

class AppTheme {
  static const Color operatorColor = Color(0xFF7EB2FF);
  static const Color clearColor = Color(0xFFFFB347);
  static const Color equalBgColor = Color(0xFF4B91FF);

  static const Color darkScaffoldBg = Color(0xFF171717);
  static const Color darkButtonBg = Color(0xFF2C2C2C);
  static const Color darkDisplayTextColor = Colors.white;
  static const Color darkSecondaryTextColor = Colors.white54;
  static const Color darkIconColor = Colors.white70;
  static const Color darkModeIconActiveBg = Color(0xFF454545);

  static const Color lightScaffoldBg = Colors.white;
  static const Color lightButtonBg = Color(0xFFF7F7F7);
  static const Color lightDisplayTextColor = Colors.black;
  static const Color lightSecondaryTextColor = Colors.black54;
  static const Color lightIconColor = Colors.black54;
  static const Color lightModeIconActiveBg = Colors.white;

  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark ? darkScaffoldBg : lightScaffoldBg,
    );
  }
}