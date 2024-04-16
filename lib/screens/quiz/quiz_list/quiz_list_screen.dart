import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/models/quiz_model.dart';
import 'package:tinBudget_app/models/quiz_repository.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quiz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: quizRepository.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final QuizModel _quiz = quizRepository[index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(QuizInfoRoute(quiz: _quiz));
                      },
                      child: AppContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 240,
                                  child: Text(
                                    _quiz.quiz,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                ),
                                Text(
                                  _quiz.date,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black40),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.accentYellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${_quiz.questions.length}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                  SizedBox(width: 3),
                                  SvgPicture.asset(
                                      'assets/images/elements/account-multiple.svg')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
