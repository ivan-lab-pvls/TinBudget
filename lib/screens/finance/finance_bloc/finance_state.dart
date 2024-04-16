part of 'finance_bloc.dart';

@immutable
abstract class FinanceState {}

class FinanceInitial extends FinanceState {}

class LoadedFinanceListState extends FinanceState {
  final int balance;
  final List<FinanceModel> finances;

  LoadedFinanceListState({required this.finances, required this.balance});
}

