part of 'finance_bloc.dart';

@immutable
abstract class FinanceEvent {}

class GetFinanceEvent extends FinanceEvent {}

class AddFinanceEvent extends FinanceEvent {
  final FinanceModel oldFinance;
  final FinanceModel newFinance;

  AddFinanceEvent({required this.oldFinance, required this.newFinance});
}
