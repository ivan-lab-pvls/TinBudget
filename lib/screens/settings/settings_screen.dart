import 'package:auto_route/auto_route.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tinBudget_app/screens/settings/widgets/settings_tile.dart';
import 'package:tinBudget_app/theme/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
              ),
              SizedBox(height: 10),
              SettingsTile(
                  title: 'Share with friends',
                  icon: 'assets/images/settings/share.svg',
                  onTap: () {
                    Share.share('Check out Tin-Budget in AppStore!');
                  }),
              SizedBox(height: 10),
              SettingsTile(
                  title: 'Terms of use',
                  icon: 'assets/images/settings/terms.svg',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ViewRead(
                                gsada:
                                    'https://docs.google.com/document/d/1a3Y5ybj3gJU3p70GkiGOJ4pFKMPcI23TilA1e_17r5I/edit?usp=sharing',
                              )),
                    );
                  }),
              SizedBox(height: 10),
              SettingsTile(
                  title: 'Privacy Policy',
                  icon: 'assets/images/settings/privacy.svg',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ViewRead(
                                gsada:
                                    'https://docs.google.com/document/d/1z9SiFTN7W1dbT7IWQnclciSMdBqdYZucK3A1ITjtP1c/edit?usp=sharing',
                              )),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewRead extends StatelessWidget {
  final String gsada;

  const ViewRead({Key? key, required this.gsada}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 172, 155, 5),
      ),
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(gsada)),
        ),
      ),
    );
  }
}
