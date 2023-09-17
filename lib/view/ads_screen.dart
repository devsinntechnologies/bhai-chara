import 'package:bhai_chara/view/account_screen.dart';
import 'package:bhai_chara/view/help_and_sports_screen.dart';
import 'package:bhai_chara/view/manage_account_screen.dart';
import 'package:bhai_chara/view/setting_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  var currentIndex;
  final pages = [
    AccountScreen(),
    AdsScreen(),
    HelpAndSportsScreen(),
    ManageAccountScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(backgroundColor: AppColors.blue,
          selectedLabelStyle: TextStyle(
            color: AppColors.TextColor,
            fontSize: 30,
            // fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle:
              TextStyle(fontSize: 30, color: AppColors.greyOutline),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat",),
            BottomNavigationBarItem(icon: Icon(Icons.sell), label: "sell"),
            BottomNavigationBarItem(icon: Icon(Icons.ads_click), label: "ads"),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: "business"),
          ]),
      appBar: AppBar(
        backgroundColor: AppColors.App,
        title: Text(
          "Ads",
          style: AppTextStyles.textStyleNormalLargeTitle
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                // height: 60,
                width: size.width * .30,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: AppColors.greyOutline,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.format_list_bulleted,
                      size: 24,
                      color: AppColors.greyOutline,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Filter",
                      style: AppTextStyles.textStyleNormalBodySmall
                          .copyWith(color: AppColors.greyOutline),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              for (int i = 0; i < 3; i++)
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: size.width,
                  // height: size.height * .40,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border:
                          Border.all(width: 2, color: AppColors.greyOutline)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From: 23 May 2023",
                        style: AppTextStyles.textStyleNormalBodyMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // 1row
                      Row(
                        children: [
                          // 1 column
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * .20,
                                  width: size.width * .20,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    image: DecorationImage(
                                        image: AssetImage("images/lining.jpg")),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ]),
                          SizedBox(
                            width: 20,
                          ),

                          // 2 columnnnn
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Car",
                                style: AppTextStyles.textStyleBoldSubTitleLarge,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Rs 1,000,00",
                                style: AppTextStyles.textStyleNormalBodyMedium
                                    .copyWith(color: AppColors.greyOutline),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Category: Car",
                                style: AppTextStyles.textStyleBoldBodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // rowww
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Views: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Container(
                            height: 35,
                            width: 3,
                            color: AppColors.greyOutline,
                          ),
                          Text(
                            "Tel: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Container(
                            height: 35,
                            width: 3,
                            color: AppColors.greyOutline,
                          ),
                          Text(
                            "Likes: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Container(
                            height: 35,
                            width: 3,
                            color: AppColors.greyOutline,
                          ),
                          Text(
                            "Chats: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
