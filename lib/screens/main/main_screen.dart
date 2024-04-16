import 'package:auto_route/auto_route.dart';
import 'package:tinBudget_app/screens/finance/finance_list/finance_list_screen.dart';
import 'package:tinBudget_app/screens/game/start_game_screen.dart';
import 'package:tinBudget_app/screens/news/news_list_screen.dart';
import 'package:tinBudget_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:tinBudget_app/screens/settings/settings_screen.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [
    FinanceListScreen(),
    NewsListScreen(),
    QuizListScreen(),
    StartGameScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: AppColors.black);
            } else {
              return IconThemeData(color: AppColors.black40);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black);
            }
            return TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: AppColors.black40);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.white75,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                  'assets/images/tab-icons/finance.svg',
                  color: AppColors.black),
              icon: SvgPicture.asset('assets/images/tab-icons/finance.svg',
                  color: AppColors.black40),
              label: 'Finance',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg',
                  color: AppColors.black),
              icon: SvgPicture.asset('assets/images/tab-icons/news.svg',
                  color: AppColors.black40),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/quiz.svg',
                  color: AppColors.black),
              icon: SvgPicture.asset('assets/images/tab-icons/quiz.svg',
                  color: AppColors.black40),
              label: 'Quiz',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/game.svg',
                  color: AppColors.black),
              icon: SvgPicture.asset('assets/images/tab-icons/game.svg',
                  color: AppColors.black40),
              label: 'Game',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset(
                  'assets/images/tab-icons/settings.svg',
                  color: AppColors.black),
              icon: SvgPicture.asset('assets/images/tab-icons/settings.svg',
                  color: AppColors.black40),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
