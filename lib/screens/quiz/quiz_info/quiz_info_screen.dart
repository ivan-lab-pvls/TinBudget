import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/models/answer_model.dart';
import 'package:tinBudget_app/models/question_model.dart';
import 'package:tinBudget_app/models/quiz_model.dart';
import 'package:tinBudget_app/screens/quiz/quiz_info/widgets/answer_widget.dart';
import 'package:tinBudget_app/screens/quiz/quiz_info/widgets/message_widget.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class QuizInfoScreen extends StatefulWidget {
  final QuizModel quiz;

  const QuizInfoScreen({super.key, required this.quiz});

  @override
  State<QuizInfoScreen> createState() => _QuizInfoScreenState();
}

class _QuizInfoScreenState extends State<QuizInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgGrey,
        centerTitle: true,
        title: Text(
          'Quiz',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        '${widget.quiz.quiz}',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.quiz.questions.length} questions',
                      style: TextStyle(
                        color: AppColors.black40,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.quiz.questions.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final QuestionModel _question =
                        widget.quiz.questions[index];
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 5),
                              SvgPicture.asset(
                                'assets/images/elements/profile.svg',
                                width: 40,
                                color: AppColors.black40,
                              ),
                              SizedBox(height: 5),
                              Text(
                                _question.userName,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                MessageWidget(
                                  child: SizedBox(
                                    width: 280,
                                    child: Text(
                                      _question.question,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (_question.isOpen) {
                                            _question.isOpen = false;
                                          } else {
                                            _question.isOpen = true;
                                          }
                                          setState(() {});
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: _question.isOpen
                                                  ? AppColors.black
                                                  : AppColors.black5,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0))),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/elements/answers.svg',
                                                color: _question.isOpen
                                                    ? AppColors.accentYellow
                                                    : AppColors.black40,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '${_question.answers.length} answers',
                                                style: TextStyle(
                                                  color: _question.isOpen
                                                      ? AppColors.accentYellow
                                                      : AppColors.black40,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${_question.date}',
                                        style: TextStyle(
                                          color: AppColors.black40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _question.isOpen
                                    ? ListView.separated(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: _question.answers.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final AnswerModel _answer =
                                              _question.answers[index];
                                          return AnswerWidget(
                                            userName: _answer.userName,
                                            answer: _answer.answer,
                                            date: _answer.date,
                                          );
                                        })
                                    : Container(),
                              ],
                            ),
                          ),
                        ],
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
