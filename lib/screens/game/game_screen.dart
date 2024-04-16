import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/screens/game/widgets/buy_button.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/action_button_widget.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final pageController = PageController();

  final panelController = PanelController();

  List<Stock> stocks = [
    Stock(
        icon: 'assets/images/game/finance.svg',
        category: 'Finance',
        price: Random().nextInt(101) + 100),
    Stock(
        icon: 'assets/images/game/retail.svg',
        category: 'Retail',
        price: Random().nextInt(201) + 300),
    Stock(
        icon: 'assets/images/game/technology.svg',
        category: 'Technology',
        price: Random().nextInt(151) + 250),
    Stock(
        icon: 'assets/images/game/pharmaceutical.svg',
        category: 'Pharmaceutical',
        price: Random().nextInt(201) + 100),
    Stock(
        icon: 'assets/images/game/energy.svg',
        category: 'Energy',
        price: Random().nextInt(351) + 200),
  ];

  int capital = 500;
  List<String> portfolio = [];

  int sellDifference = Random().nextInt(111) - 20;

  void buyStock(String category) {
    Stock boughtStock =
        stocks.firstWhere((stock) => stock.category == category);
    if (capital >= boughtStock.price) {
      setState(() {
        capital -= boughtStock.price;
        portfolio.add(category);
      });
      _updateStockPrice(category);
      stocks.firstWhere((stock) => stock.category == category).price =
          Random().nextInt(101) + 100;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.accentYellow,
          content: Text(
            'You do not have enough money!',
            style: TextStyle(color: AppColors.black),
          ),
        ),
      );
    }
  }

  void sellStock(String category) {
    Stock soldStock = stocks.firstWhere((stock) => stock.category == category);
    setState(() {
      capital += soldStock.price + sellDifference;

      if (capital >= 1000000) {
        panelController.open();
      }
      portfolio.removeLast();
    });
    sellDifference = Random().nextInt(111) - 20;
    _updateStockPrice(category);
  }

  void _updateStockPrice(String category) {
    setState(() {
      stocks.removeWhere((stock) => stock.category == category);
      stocks.add(Stock(
          icon: 'assets/images/game/${category.toLowerCase()}.svg',
          category: category,
          price: Random().nextInt(101) + 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgGrey,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              context.router.push(MainRoute());
            },
            child: Icon(Icons.arrow_back)),
        title: Column(
          children: [
            Text(
              'Game',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Stock Tycoon',
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
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {});
              },
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: AppColors.accentYellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/game/goal.svg'),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your goal',
                                    style: TextStyle(
                                      color: AppColors.black40,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '$capital\$',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '/1,000,000\$',
                                        style: TextStyle(
                                          color: AppColors.black40,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Stocks',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.black40,
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (pageController.page! < 1) {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: stocks
                              .map(
                                (stock) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: AppContainer(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(stock.icon),
                                            SizedBox(width: 4),
                                            Text(
                                              stock.category,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${stocksValues[stock.category]}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            GameButton(
                                              text: 'Buy stocks',
                                              width: 150,
                                              onTap: () =>
                                                  buyStock(stock.category),
                                              backgroundColor:
                                                  AppColors.accentYellow,
                                              textColor: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: AppColors.accentYellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/game/goal.svg'),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your goal',
                                    style: TextStyle(
                                      color: AppColors.black40,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '$capital\$',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '/1,000,000\$',
                                        style: TextStyle(
                                          color: AppColors.black40,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Your buying stocks',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.black40,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                if (pageController.page! > 0) {
                                  pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                }
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                        portfolio.isEmpty
                            ? AppContainer(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/elements/alert.svg'),
                                    SizedBox(width: 5),
                                    Text(
                                      'Buy a stock to add to your portfolio.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: portfolio
                                    .toSet()
                                    .map(
                                      (category) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: AppContainer(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/images/game/${category.toLowerCase()}.svg'),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        category,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/images/game/bag.svg'),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        '${portfolio.where((item) => item == category).length}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${stocks[stocks.indexWhere((element) => element.category == category)].price + sellDifference}\$',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                      GameButton(
                                                          text: 'Sell',
                                                          width: 150,
                                                          onTap: () =>
                                                              sellStock(
                                                                  category),
                                                          backgroundColor:
                                                              AppColors.black5,
                                                          textColor:
                                                              AppColors.black)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${stocks[stocks.indexWhere((element) => element.category == category)].price}\$',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                      GameButton(
                                                          text: 'Buy',
                                                          width: 150,
                                                          onTap: () => buyStock(
                                                              category),
                                                          backgroundColor:
                                                              AppColors
                                                                  .accentYellow,
                                                          textColor:
                                                              AppColors.black)
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SlidingUpPanel(
                panel: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset('assets/images/game/win.png'),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              'You win!',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black),
                            ),
                            Text(
                              'You raised 1 000 000\$ on stocks',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black40),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ActionButtonWidget(
                            text: 'Restart',
                            width: 300,
                            onTap: () {
                              context.router.push(GameRoute());
                            }),
                      ],
                    ),
                  ),
                ),
                color: AppColors.bgGrey,
                controller: panelController,
                maxHeight: MediaQuery.of(context).size.height * 0.45,
                defaultPanelState: PanelState.CLOSED,
                minHeight: 0,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                backdropEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stock {
  String category;
  int price;
  String icon;

  Stock({required this.category, required this.price, required this.icon});
}

final Map<String, String> stocksValues = {
  'Finance': '100 - 200\$',
  'Retail': '300 - 500\$',
  'Technology': '250 - 400\$',
  'Pharmaceutical': '100 - 300\$',
  'Energy': '200 - 550\$',
};
