import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'view/authentication/login_screen.dart';
import 'controller/services/auth_service.dart';
import 'package:bhai_chara/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bhai_chara/view/chatting/view/chat_view.dart';
import 'package:bhai_chara/view/onboard_screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import 'controller/provider/root_provider.dart';
import 'controller/provider/timer_provider.dart';
import 'controller/provider/slider_provider.dart';
import 'controller/provider/switch_provider.dart';
import 'controller/provider/firebase/addImages.dart';
import 'controller/provider/firebase/addproduct.dart';
import 'controller/provider/visibility_provider.dart';
import 'view/authentication/signup_screen_by_email.dart';
import 'controller/provider/Image_Picker/compress_provider.dart';
import 'controller/provider/authentication_provider/auth_provider.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';

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
          // ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => AuthService()),

          ChangeNotifierProvider(create: (context) => CompressProvider()),
          // ChangeNotifierProvider(create: (context) => ChatProvider()),

          // ChangeNotifierProvider(create: (context) => ()),
        ],
        child: Sizer(
          builder:(context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(
              //   fontFamily: "Lora-Regular",
              // ),
              // home: ChatView(),
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context,AsyncSnapshot<User?> snapshot){
                  if(snapshot.hasData && snapshot.data !=null){
                      return ChatView();
                  }else if(snapshot.connectionState== ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return LoginScreen();
                }
              )
            );
          }
        ));
  }
}
