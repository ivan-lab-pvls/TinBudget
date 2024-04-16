import 'package:tinBudget_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final String icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.black5,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: SvgPicture.asset(icon),
    );
  }
}
