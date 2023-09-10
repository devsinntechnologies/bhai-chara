import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/view/home_screen.dart';
import 'package:bhai_chara/view/sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/root_provider.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  
  var iconsList = [
    Icons.person,
    Icons.scanner,
    Icons.home,
    Icons.star,
    Icons.settings
  ];

  var screensList = [
    HomeScreen(),
    HomeScreen(),
    SellScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  var textList = [
    "Home",
    "Chat",
    "Sell",
    "Ads",
    "Account",
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var myProvider = context.watch<RootProvider>();

      return 
         Scaffold(
              body: screensList[myProvider.selectedScreen(0.toInt())],
             // body: myProvider.screensList[myProvider.selectedScreen],
              bottomNavigationBar: Container(
                height: 70,
                color: AppColors.White,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < iconsList.length; i++)
                        InkWell(
                            onTap: (() {
                              var pro = context.read<RootProvider>();
                              pro.selectedScreen(i);
                            }),
                            child: myProvider.selectedScreen(0.toInt()) == i
                                ? Container(
                                    color: Colors.transparent,
                                    // margin: EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          iconsList[i],
                                          size: 35,
                                          color: AppColors.blue,
                                        ),
                                        Text(
                                          textList[i],
                                          style: TextStyle(
                                              color: AppColors.blue,
                                              fontFamily: "Poppins-Bold"),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        iconsList[i],
                                        size: 20,
                                        color: AppColors.darkGrey,
                                      ),
                                      Text(textList[i]),
                                    ],
                                  ))
                    ]),
              ),
            );
    });
  }
}
