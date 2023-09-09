import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Row(
              children: [
                Image(image: AssetImage('assets/images/Bhai Chara svg 1.png'), height: 45, width: 45,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
