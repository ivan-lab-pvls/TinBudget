import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String text;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onTap;
  const GameButton({super.key, required this.text, required this.width, required this.onTap, required this.backgroundColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
