import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/tempoprovider.dart';
import 'package:bhai_chara/view/live_chatt_screen.dart';
import 'package:bhai_chara/view/review_details_screen.dart';
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
        ChangeNotifierProvider(create: (context)=> SwitchProvider() )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
       // theme: ThemeData(primarySwatch: Colors.black)
        
         home: ChattListScreen(),
        
        ));
  }
}