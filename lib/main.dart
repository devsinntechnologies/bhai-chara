import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/slider_provider.dart';
import 'package:bhai_chara/provider/switch_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/view/account/account_screen.dart';

import 'package:bhai_chara/view/help_and_sports_screen.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:bhai_chara/view/settings-screens/create_pasward_screen.dart';
import 'package:bhai_chara/view/settings-screens/manage_account_screen.dart';
import 'package:bhai_chara/view/settings-screens/privacyScreen.dart';
import 'package:bhai_chara/view/settings-screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (context) => SplashProvider()),
          ChangeNotifierProvider(create: (context) => RootProvider()),
          ChangeNotifierProvider(create: (context) => visibilityProvider1()),
          ChangeNotifierProvider(create: (context) => visibilityProvider2()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
           ChangeNotifierProvider(create: (context) => SwitchProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ManageAccountScreen(),
          theme: ThemeData(fontFamily: 'Roboto-Regular.ttf'),
        ));
  }
}
//post detail 1 & 2 where to attatch?

/*

 


*/