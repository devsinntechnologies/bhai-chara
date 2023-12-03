// ignore_for_file: must_be_immutable

import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/view/home-screens/home_screen.dart';
import 'package:bhai_chara/view/home-screens/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/root_provider.dart';
import '../../view/chatting/view/chat_view.dart';
import '../account/account_screen.dart';
import 'package:bhai_chara/view/order_screen.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  var iconsList = [
    Icons.home,
    Icons.chat,
    Icons.sell,
    Icons.sell,
    Icons.person
  ];

  var screensList = [
    HomeScreen(),
    ChatView(),
    SellScreen(),
    OrderScreen(),
    AccountScreen(),
  ];

  var textList = [
    "Home",
    "Chat",
    "Donate",
    "Request",
    "Account",
  ];
  Future<bool> showExitPopup(context) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit Bhai Chara App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var myProvider = context.watch<RootProvider>();

      return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: SafeArea(
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
        ),
      );
    });
  }
}
