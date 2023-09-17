import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/view/home-screens/home_screen.dart';
import 'package:bhai_chara/view/home-screens/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/root_provider.dart';
import '../account/account_screen.dart';
import '../ads/ads_screen.dart';
import '../chat_list_screen.dart';

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
    ChattListScreen(),
    SellScreen(),
    AdsScreen(),
    AccountScreen(),
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

      return Scaffold(
        body: screensList[myProvider.selectedScreenValue],
        bottomNavigationBar: Container(
          height: 70,
          color: AppColors.White,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            for (int i = 0; i < iconsList.length; i++)
              InkWell(
                  onTap: (() {
                    var pro = context.read<RootProvider>();
                    pro.setSelectedScreen(i);
                  }),
                  child: myProvider.selectedScreenValue == i
                      ? Container(
                          color: AppColors.White,
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
                              color: AppColors.darkGrey,
                            ),
                            Text(
                              textList[i],
                              style: const TextStyle(
                                  color: AppColors.darkGrey,
                                ),
                            ),
                          ],
                        ))
          ]),
        ),
      );
    });
  }
}
