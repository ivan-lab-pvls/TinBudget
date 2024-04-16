import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/screens/finance/add_finance/add_finance_screen.dart';
import 'package:tinBudget_app/screens/finance/finance_details/finance_details_screen.dart';
import 'package:tinBudget_app/screens/finance/finance_list/finance_list_screen.dart';
import 'package:tinBudget_app/screens/game/game_screen.dart';
import 'package:tinBudget_app/screens/game/start_game_screen.dart';
import 'package:tinBudget_app/screens/main/main_screen.dart';
import 'package:tinBudget_app/screens/news/news_info_screen.dart';
import 'package:tinBudget_app/screens/news/news_list_screen.dart';
import 'package:tinBudget_app/screens/onboarding/onboarding_screen.dart';
import 'package:tinBudget_app/models/news_model.dart';
import 'package:tinBudget_app/models/quiz_model.dart';
import 'package:tinBudget_app/screens/quiz/quiz_info/quiz_info_screen.dart';
import 'package:tinBudget_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:tinBudget_app/screens/settings/settings_screen.dart';
import 'package:tinBudget_app/models/finance_model.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: NewsInfoRoute.page),
        AutoRoute(page: NewsListRoute.page),
        AutoRoute(page: QuizListRoute.page),
        AutoRoute(page: QuizInfoRoute.page),
        AutoRoute(page: FinanceListRoute.page),
        AutoRoute(page: FinanceDetailsRoute.page),
        AutoRoute(page: AddFinanceRoute.page),
        AutoRoute(page: StartGameRoute.page),
        AutoRoute(page: GameRoute.page),
      ];
}
