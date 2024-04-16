
import 'package:hive_flutter/hive_flutter.dart';

part 'income_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel {
  @HiveField(0)
  final int value;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String icon;

  IncomeModel(
      {required this.value, required this.category, required this.icon});
}
