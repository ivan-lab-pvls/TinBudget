import 'package:tinBudget_app/models/question_model.dart';

class QuizModel {
  final String quiz;
  final String date;
  final List<QuestionModel> questions;

  QuizModel({required this.quiz, required this.date, required this.questions});
}
