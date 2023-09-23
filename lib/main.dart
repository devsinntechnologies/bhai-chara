import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/slider_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/view/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home-screens/home_screen.dart';

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
          ChangeNotifierProvider(create: (context) => visibilityProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
          // ChangeNotifierProvider(create: (context) => SwitchProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          theme: ThemeData(fontFamily: 'Roboto-Regular.ttf'),
        ));
  }
}
//post detail 1 & 2 where to attatch?
//last screen help and support missing
//privacy screen missing
//setting screens all errors
