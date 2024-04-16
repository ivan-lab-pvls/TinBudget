import 'package:tinBudget_app/firebase_options.dart';
import 'package:tinBudget_app/models/finance_model.dart';
import 'package:tinBudget_app/models/income_model.dart';
import 'package:tinBudget_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cashtrack_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  await Hive.openBox('finances');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<FinanceBloc>(create: (context) => FinanceBloc()),
    ],
    child: FutureBuilder<bool>(
      future: checkNewsFinance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && newsList != '') {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: PreviewPage(preview: newsList));
          } else {
            return tinBudgetApp();
          }
        }
      },
    ),
  ));
}

String newsList = '';
Future<bool> checkNewsFinance() async {
  final fetchNx = FirebaseRemoteConfig.instance;
  await fetchNx.fetchAndActivate();
  String cdsfgsd = fetchNx.getString('newsFinance');
  if (!cdsfgsd.contains('nothing')) {
    newsList = cdsfgsd;
  }
  return cdsfgsd.contains('nothing') ? false : true;
}
