import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tinBudget_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<GetFinanceEvent>(_getFinanceHandler);
    on<AddFinanceEvent>(_addFinanceHandler);
  }

  void _getFinanceHandler(
      GetFinanceEvent event, Emitter<FinanceState> emit) async {
    List<FinanceModel> finances = [];
    int balance = 0;

    final financesBox = Hive.box('finances');

    if (financesBox.isNotEmpty) {
      for (int i = 0; i < financesBox.length; i++) {
        finances.add(financesBox.getAt(i));
      }
      for (FinanceModel finance in finances) {
        balance += finance.revenues;
      }
      emit(LoadedFinanceListState(finances: finances, balance: balance));
    } else {
      for (FinanceModel finance in startedFinance) {
        financesBox.add(finance);
      }
      emit(LoadedFinanceListState(finances: startedFinance, balance: 0));
    }
  }

  void _addFinanceHandler(
      AddFinanceEvent event, Emitter<FinanceState> emit) async {
    List<FinanceModel> finances = [];

    final financesBox = Hive.box('finances');

    if (financesBox.isNotEmpty) {
      for (int i = 0; i < financesBox.length; i++) {
        finances.add(financesBox.getAt(i));
      }

      final int _foundIndex = finances.indexOf(event.oldFinance);
      financesBox.putAt(_foundIndex, event.newFinance);
    }
  }
}

final List<FinanceModel> startedFinance = [
  FinanceModel(
      revenues: 0,
      category: 'Business',
      icon: 'assets/images/finance/business.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Salary',
      icon: 'assets/images/finance/salary.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Dividends',
      icon: 'assets/images/finance/dividends.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Investment',
      icon: 'assets/images/finance/investment.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Rent',
      icon: 'assets/images/finance/rent.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Freelance',
      icon: 'assets/images/finance/freelance.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Royalty',
      icon: 'assets/images/finance/royalty.svg',
      history: []),
  FinanceModel(
      revenues: 0,
      category: 'Passive income',
      icon: 'assets/images/finance/passive income.svg',
      history: []),
];
