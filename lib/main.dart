import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/tempoprovider.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home-screens/product_details_screen.dart';
import 'view/settings-screens/create_pasward_screen.dart';
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
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CreatePasswardScreen(),
        ));
  }
}
