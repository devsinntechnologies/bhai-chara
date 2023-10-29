// ignore_for_file: must_be_immutable

import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/view/home-screens/home_screen.dart';
import 'package:bhai_chara/view/home-screens/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/root_provider.dart';
import '../account/account_screen.dart';
import '../ads/ads_screen.dart';
import '../chatt/chat_list_screen.dart';
import '../chatt/chat_view.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  var iconsList = [
    Icons.home,
    Icons.chat,
    Icons.sell,
    Icons.ads_click,
    Icons.person
  ];

  var screensList = [
    HomeScreen(),
    ChatView(),
    SellScreen(),
    AdsScreen(),
    AccountScreen(),
  ];

  var textList = [
    "Home",
    "Chat",
    "Donate",
    "Ads",
    "Account",
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var myProvider = context.watch<RootProvider>();

      return SafeArea(
        child: Scaffold(
          body: screensList[myProvider.selectedScreenValue],
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 75,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -1),
                    color: AppColors.lightblue),
              ],
              color: Color(0xfaFFFFFF),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < iconsList.length; i++)
                    InkWell(
                        onTap: (() {
                          var pro = context.read<RootProvider>();
                          pro.setSelectedScreen(i);
                        }),
                        child: myProvider.selectedScreenValue == i
                            ? Container(
                                color: AppColors.white,
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
                                      style: const TextStyle(
                                        color: AppColors.blue,
                                      ),
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
                                    color: AppColors.secondary,
                                  ),
                                  Text(
                                    textList[i],
                                    style: const TextStyle(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ],
                              ))
                ]),
          ),
        ),
      );
    });
  }
}
