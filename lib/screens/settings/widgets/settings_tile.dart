import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const SettingsTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.black5,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: SvgPicture.asset(icon),
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black40,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
