
import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/account_screen.dart';
import 'package:bhai_chara/view/ads_screen.dart';
import 'package:bhai_chara/view/help_and_sports_screen.dart';
import 'package:bhai_chara/view/manage_account_screen.dart';
import 'package:bhai_chara/view/setting_screen.dart';
import 'package:bhai_chara/view/user_preferences_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> SplashProvider() )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Schyler",
        ),
        // home: SplashScreen(),
        // home: SettingScreen(),
        // home: AccountScreen(),
        // home: UserPreferencesScreen(),
        // home: HelpAndSportsScreen(),
        // home: ManageAccountScreen(),
        home: AdsScreen(),

      ));
  }
  
}