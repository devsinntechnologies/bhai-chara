import 'package:bhai_chara/firebase_options.dart';
import 'package:bhai_chara/provider/firebase/addImages.dart';
import 'package:bhai_chara/provider/firebase/addproduct.dart';
import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/slider_provider.dart';
import 'package:bhai_chara/provider/timer_provider.dart';
import 'package:bhai_chara/provider/switch_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:bhai_chara/view/home-screens/sell_screen.dart';
import 'package:bhai_chara/view/onboard_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/authentication_provider/auth_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TimerProvider()),
          ChangeNotifierProvider(create: (context) => visibilityProvider1()),
          ChangeNotifierProvider(create: (context) => visibilityProvider2()),
          ChangeNotifierProvider(create: (context) => SwitchProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
          ChangeNotifierProvider(create: (context) => RootProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => FireStoreProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),

          // ChangeNotifierProvider(create: (context) => ()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   fontFamily: "Lora-Regular",
          // ),
          home: RootScreen(),
        ));
  }
}
