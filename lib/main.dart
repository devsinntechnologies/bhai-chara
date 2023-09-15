import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/slider_provider.dart';
import 'package:bhai_chara/provider/switch_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/tempoprovider.dart';
import 'package:bhai_chara/view/home-screens/home_screen.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home-screens/product_details_screen.dart';
import 'view/home-screens/sell_screen.dart';
import 'view/home-screens/sell_sub_categorie_screen.dart';
import 'view/settings-screens/create_pasward_screen.dart';
import 'view/settings-screens/review_screen.dart';
import 'view/settings-screens/user_preferences_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashProvider()),
          ChangeNotifierProvider(create: (context) => RootProvider()),
          ChangeNotifierProvider(create: (context) => visibilityProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
           ChangeNotifierProvider(create: (context) => SwitchProvider()),
          
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RootScreen(),
        ));
  }
}
