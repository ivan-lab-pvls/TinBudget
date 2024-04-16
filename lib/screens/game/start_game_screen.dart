import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:tinBudget_app/widgets/action_button_widget.dart';
import 'package:tinBudget_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppContainer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 5),
                  Column(
                    children: [
                      SvgPicture.asset('assets/images/game/logo.svg'),
                      SizedBox(height: 10),
                      Text(
                        'Stock Tycoon',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black),
                      ),
                      Text(
                        'Buy, sell, and trade stocks',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black40),
                      ),
                    ],
                  ),
                  ActionButtonWidget(
                      text: 'Start',
                      width: 300,
                      onTap: () {
                        context.router.push(GameRoute());
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
