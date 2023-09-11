


import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/view/chat_list_screen.dart';
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
        ChangeNotifierProvider(create: (context)=> SplashProvider() )
      ],
      child: MaterialApp(
       // theme: ThemeData(primarySwatch: Colors.black)
        
        home: ChattListScreen(),));
  }
}