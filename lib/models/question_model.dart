import 'package:tinBudget_app/models/answer_model.dart';

class QuestionModel {
  final String userName;
  final String question;
  final String date;
  final List<AnswerModel> answers;
  bool isOpen;

  QuestionModel({
    required this.userName,
    required this.question,
    required this.date,
    required this.answers,
    required this.isOpen,
  });
}
