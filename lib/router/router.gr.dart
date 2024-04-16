// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddFinanceRoute.name: (routeData) {
      final args = routeData.argsAs<AddFinanceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddFinanceScreen(
          key: args.key,
          finance: args.finance,
        ),
      );
    },
    FinanceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FinanceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FinanceDetailsScreen(
          key: args.key,
          finance: args.finance,
        ),
      );
    },
    FinanceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceListScreen(),
      );
    },
    GameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    QuizInfoRoute.name: (routeData) {
      final args = routeData.argsAs<QuizInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizInfoScreen(
          key: args.key,
          quiz: args.quiz,
        ),
      );
    },
    QuizListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizListScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    StartGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartGameScreen(),
      );
    },
  };
}

/// generated route for
/// [AddFinanceScreen]
class AddFinanceRoute extends PageRouteInfo<AddFinanceRouteArgs> {
  AddFinanceRoute({
    Key? key,
    required FinanceModel finance,
    List<PageRouteInfo>? children,
  }) : super(
          AddFinanceRoute.name,
          args: AddFinanceRouteArgs(
            key: key,
            finance: finance,
          ),
          initialChildren: children,
        );

  static const String name = 'AddFinanceRoute';

  static const PageInfo<AddFinanceRouteArgs> page =
      PageInfo<AddFinanceRouteArgs>(name);
}

class AddFinanceRouteArgs {
  const AddFinanceRouteArgs({
    this.key,
    required this.finance,
  });

  final Key? key;

  final FinanceModel finance;

  @override
  String toString() {
    return 'AddFinanceRouteArgs{key: $key, finance: $finance}';
  }
}

/// generated route for
/// [FinanceDetailsScreen]
class FinanceDetailsRoute extends PageRouteInfo<FinanceDetailsRouteArgs> {
  FinanceDetailsRoute({
    Key? key,
    required FinanceModel finance,
    List<PageRouteInfo>? children,
  }) : super(
          FinanceDetailsRoute.name,
          args: FinanceDetailsRouteArgs(
            key: key,
            finance: finance,
          ),
          initialChildren: children,
        );

  static const String name = 'FinanceDetailsRoute';

  static const PageInfo<FinanceDetailsRouteArgs> page =
      PageInfo<FinanceDetailsRouteArgs>(name);
}

class FinanceDetailsRouteArgs {
  const FinanceDetailsRouteArgs({
    this.key,
    required this.finance,
  });

  final Key? key;

  final FinanceModel finance;

  @override
  String toString() {
    return 'FinanceDetailsRouteArgs{key: $key, finance: $finance}';
  }
}

/// generated route for
/// [FinanceListScreen]
class FinanceListRoute extends PageRouteInfo<void> {
  const FinanceListRoute({List<PageRouteInfo>? children})
      : super(
          FinanceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<void> {
  const GameRoute({List<PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizInfoScreen]
class QuizInfoRoute extends PageRouteInfo<QuizInfoRouteArgs> {
  QuizInfoRoute({
    Key? key,
    required QuizModel quiz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizInfoRoute.name,
          args: QuizInfoRouteArgs(
            key: key,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizInfoRoute';

  static const PageInfo<QuizInfoRouteArgs> page =
      PageInfo<QuizInfoRouteArgs>(name);
}

class QuizInfoRouteArgs {
  const QuizInfoRouteArgs({
    this.key,
    required this.quiz,
  });

  final Key? key;

  final QuizModel quiz;

  @override
  String toString() {
    return 'QuizInfoRouteArgs{key: $key, quiz: $quiz}';
  }
}

/// generated route for
/// [QuizListScreen]
class QuizListRoute extends PageRouteInfo<void> {
  const QuizListRoute({List<PageRouteInfo>? children})
      : super(
          QuizListRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartGameScreen]
class StartGameRoute extends PageRouteInfo<void> {
  const StartGameRoute({List<PageRouteInfo>? children})
      : super(
          StartGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
