import 'package:bhai_chara/view/home_screen.dart';
import 'package:bhai_chara/view/sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/root_provider.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  int selectedScreen = 0;
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

      return myProvider.isLoading
          ? CircularProgressIndicator.adaptive()
          : Scaffold(
              body: screensList[selectedScreen],
             // body: myProvider.screensList[myProvider.selectedScreen],
              bottomNavigationBar: Container(
                height: 70,
                color: Color.fromARGB(255, 235, 239, 232),
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
                            child: selectedScreen == i
                                ? Container(
                                    color: Colors.transparent,
                                    // margin: EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          iconsList[i],
                                          size: 35,
                                          color: Colors.blueGrey,
                                        ),
                                        Text(
                                          textList[i],
                                          style: TextStyle(
                                              color: Colors.blueGrey,
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
                                        color: Colors.blueGrey[200],
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
