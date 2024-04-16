import 'package:tinBudget_app/models/income_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 0)
class FinanceModel {
  @HiveField(0)
  int revenues;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String icon;
  @HiveField(3)
  List<IncomeModel> history;

  FinanceModel(
      {required this.revenues,
      required this.category,
      required this.icon,
      required this.history});
}
