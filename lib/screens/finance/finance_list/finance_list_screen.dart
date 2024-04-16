import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/models/finance_model.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/action_button_widget.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:tinBudget_app/widgets/icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class FinanceListScreen extends StatefulWidget {
  const FinanceListScreen({super.key});

  @override
  State<FinanceListScreen> createState() => _FinanceListScreenState();
}

class _FinanceListScreenState extends State<FinanceListScreen> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: BlocProvider(
        create: (context) => FinanceBloc()..add(GetFinanceEvent()),
        child: BlocConsumer<FinanceBloc, FinanceState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedFinanceListState) {
              return SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Balance',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black40),
                                    ),
                                    Text(
                                      '${state.balance}\$',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    panelController.open();
                                  },
                                  child:
                                      Icon(Icons.add, color: AppColors.black),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(10),
                                    backgroundColor: AppColors.accentYellow,
                                    foregroundColor: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Category',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black40),
                              ),
                            ),
                            SizedBox(height: 10),
                            GridView.builder(
                              itemCount: state.finances.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int index) {
                                final FinanceModel _finance =
                                    state.finances[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.router.push(
                                        FinanceDetailsRoute(finance: _finance));
                                  },
                                  child: AppContainer(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconContainer(icon: _finance.icon),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _finance.category,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black40),
                                            ),
                                            Text(
                                              '${_finance.revenues}\$',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: SlidingUpPanel(
                        panel: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Add income',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        panelController.close();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: AppColors.black5,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0))),
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.separated(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.finances.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const SizedBox(
                                              height: 10,
                                            ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final FinanceModel _finance =
                                          state.finances[index];
                                      return AppContainer(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconContainer(
                                                    icon: _finance.icon),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _finance.category,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .black40),
                                                    ),
                                                    Text(
                                                      '${_finance.revenues}\$',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              AppColors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            ActionButtonWidget(
                                                text: 'Add Income',
                                                width: 150,
                                                onTap: () {
                                                  context.router.push(
                                                      AddFinanceRoute(
                                                          finance: _finance));
                                                }),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                        color: AppColors.bgGrey,
                        controller: panelController,
                        maxHeight: MediaQuery.of(context).size.height * 0.75,
                        defaultPanelState: PanelState.CLOSED,
                        minHeight: 0,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        backdropEnabled: true,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
