import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isCircle;
  final IconData? icon;

  const CalcButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.isCircle = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: AspectRatio(
          aspectRatio: isCircle ? 1 : 2.2,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? const Color(0xFF2C2C2C),
              foregroundColor: textColor ?? Colors.white,
              shape: isCircle
                  ? const CircleBorder()
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            child: icon != null
                ? Icon(icon, size: 28, color: textColor)
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
