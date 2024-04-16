import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/models/finance_model.dart';
import 'package:tinBudget_app/models/income_model.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/action_button_widget.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:tinBudget_app/widgets/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class FinanceDetailsScreen extends StatefulWidget {
  final FinanceModel finance;

  const FinanceDetailsScreen({super.key, required this.finance});

  @override
  State<FinanceDetailsScreen> createState() => _FinanceDetailsScreenState();
}

class _FinanceDetailsScreenState extends State<FinanceDetailsScreen> {
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
              'Finance',
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
              children: [
                AppContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.finance.category,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black40),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Revenues',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black40),
                              ),
                              Text(
                                '${widget.finance.revenues}\$',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black),
                              ),
                            ],
                          ),
                          ActionButtonWidget(
                              text: 'Add Income',
                              width: 150,
                              onTap: () {
                                context.router.push(
                                    AddFinanceRoute(finance: widget.finance));
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'History',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black40),
                  ),
                ),
                SizedBox(height: 10),
                widget.finance.history.isEmpty
                    ? AppContainer(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                                'assets/images/elements/alert.svg'),
                            SizedBox(
                              width: 300,
                              child: Text(
                                'This category is empty, add revenue so you can manage and track your dosodes.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.finance.history.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final IncomeModel _income =
                              widget.finance.history[index];
                          return AppContainer(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconContainer(icon: _income.icon),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _income.category,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black),
                                        ),
                                        Text(
                                          'Income',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black40),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '+${_income.value}\$',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black),
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
