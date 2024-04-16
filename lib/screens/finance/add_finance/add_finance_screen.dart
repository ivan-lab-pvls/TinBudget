import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/models/finance_model.dart';
import 'package:tinBudget_app/models/income_model.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/action_button_widget.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddFinanceScreen extends StatefulWidget {
  final FinanceModel finance;

  const AddFinanceScreen({super.key, required this.finance});

  @override
  State<AddFinanceScreen> createState() => _AddFinanceScreenState();
}

class _AddFinanceScreenState extends State<AddFinanceScreen> {
  final valueController = TextEditingController();

  List<String> categoryList = [
    'Business',
    'Salary',
    'Dividends',
    'Investment',
    'Rent',
    'Freelance',
    'Royalty',
    'Passive income'
  ];
  String category = 'Business';
  int _categoryIndex = 0;

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgGrey,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Add income',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.finance.category,
              style: TextStyle(
                color: AppColors.black40,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black40,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(color: AppColors.black),
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0,00\$',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black40,
                        ),
                        filled: true,
                        fillColor: AppColors.black5,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black40,
                  ),
                ),
                SizedBox(height: 10),
                ChipList(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  spacing: 5,
                  runSpacing: 5,
                  listOfChipNames: categoryList,
                  activeBorderColorList: [AppColors.black],
                  inactiveBorderColorList: [AppColors.black5],
                  activeBgColorList: [AppColors.black],
                  inactiveBgColorList: [AppColors.black5],
                  activeTextColorList: [AppColors.accentYellow],
                  inactiveTextColorList: [AppColors.black40],
                  listOfChipIndicesCurrentlySeclected: [_categoryIndex],
                  shouldWrap: true,
                  checkmarkColor: AppColors.accentYellow,
                  extraOnToggle: (val) {
                    _categoryIndex = val;
                    setState(() {
                      category = categoryList[_categoryIndex];
                    });
                  },
                ),
                SizedBox(height: 20),
                ActionButtonWidget(
                    text: 'Add Income',
                    width: double.infinity,
                    onTap: () {
                      if (valueController.text.isNotEmpty &&
                          int.tryParse(valueController.text) != null) {
                        FinanceModel newFinance = widget.finance;
                        newFinance.revenues += int.parse(valueController.text);
                        newFinance.history.insert(
                            0,
                            IncomeModel(
                                value: int.parse(valueController.text),
                                category: category,
                                icon:
                                    'assets/images/finance/${category.toLowerCase()}.svg'));
                        context.read<FinanceBloc>().add(AddFinanceEvent(
                            oldFinance: widget.finance,
                            newFinance: newFinance));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.accentYellow,
                            content: Text(
                              'Successfully added!',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        );
                        context.router.push(MainRoute());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.accentYellow,
                            content: Text(
                              'Firstly, enter correct information',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
