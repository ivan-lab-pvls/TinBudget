import 'package:tinBudget_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Widget child;
  const MessageWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(12))),
      child: child,
    );
  }
}
