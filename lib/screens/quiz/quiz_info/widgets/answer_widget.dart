import 'package:tinBudget_app/screens/quiz/quiz_info/widgets/message_widget.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerWidget extends StatelessWidget {
  final String userName;
  final String answer;
  final String date;

  const AnswerWidget(
      {super.key,
      required this.userName,
      required this.answer,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/elements/profile.svg',
                  width: 40,
                  color: AppColors.black40,
                ),
                SizedBox(width: 15),
                Text(
                  userName,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          MessageWidget(
            child: SizedBox(
              width: 280,
              child: Text(
                answer,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black5,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: SvgPicture.asset(
                    'assets/images/elements/smile.svg',
                    width: 25,
                    color: AppColors.black40,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  date,
                  style: TextStyle(
                    color: AppColors.black40,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
