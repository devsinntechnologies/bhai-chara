import 'package:bhai_chara/controller/provider/firebase/addproduct.dart';
import 'package:bhai_chara/controller/provider/firebase/firebaseauthentication.dart';
import 'package:bhai_chara/controller/provider/root_provider.dart';
import 'package:bhai_chara/controller/provider/slider_provider.dart';
import 'package:bhai_chara/controller/provider/timer_provider.dart';
import 'package:bhai_chara/controller/provider/switch_provider.dart';
import 'package:bhai_chara/controller/provider/visibility_provider.dart';
import 'package:bhai_chara/view/onboard_screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view/home-screens/root_screen.dart';
import 'controller/provider/authentication_provider/number_provider.dart';
import 'controller/provider/authentication_provider/variable_provider.dart';
import 'firebase_options.dart';

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
          ChangeNotifierProvider(create: (context) => VariableProvider()),
          ChangeNotifierProvider(create: (context) => visibilityProvider1()),
          ChangeNotifierProvider(create: (context) => visibilityProvider2()),
          ChangeNotifierProvider(create: (context) => SwitchProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
          ChangeNotifierProvider(create: (context) => VariableProvider()),
          ChangeNotifierProvider(create: (context) => RootProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => NumberProvider()),
          ChangeNotifierProvider(create: (context) => FireAuthProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Lora-Regular",
          ),
          // home: SplashScreen(),
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return RootScreen();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return RootScreen();
              }),
        ));
  }
}
