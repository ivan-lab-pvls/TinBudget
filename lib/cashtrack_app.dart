import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tinBudget_app/router/router.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String preview;

  PreviewPage({required this.preview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(preview)),
        ),
      ),
    );
  }
}

class tinBudgetApp extends StatelessWidget {
  tinBudgetApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
