import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  var currentIndex = 0;
  final pages = [
    NavigationDestination(
      icon: Icon(Icons.abc_outlined),
      label: "ac",
      selectedIcon: Icon(Icons.ac_unit),
    ),
    NavigationDestination(
      icon: Icon(Icons.home),
      label: "home",
      selectedIcon: Icon(Icons.free_breakfast),
    ),
    // NavigationDestination(icon: Icon(Icons.ac_unit), label: "Ac"),
    // NavigationDestination(icon: Icon(Icons.access_alarm), label: "Access"),
    // NavigationDestination(icon: Icon(Icons.offline_bolt), label: "Bolt"),
    // NavigationDestination(icon: Icon(Icons.badge), label: "Badge"),
    // NavigationDestination(icon: Icon(Icons.laptop_chromebook), label: "Laptop")
    // UserPreferencesScreen(),
    // AccountScreen(),
    // AdsScreen(),

    // HelpAndSportsScreen(),
    // ManageAccountScreen(),
    // SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      // backgroundColor: Colors.amberAccent,
      // currentIndex: currentIndex,

      // showSelectedLabels: true,
      // showUnselectedLabels: true,
      // backgroundColor: AppColors.blue,
      // fixedColor: AppColors.darkGrey,
      // selectedIconTheme: IconThemeData(size: 20, color: AppColors.blue,weight: 20),
      // unselectedIconTheme:
      //     IconThemeData(
      //       size: 20, weight: 20, color: AppColors.darkGrey,),
      // selectedLabelStyle: TextStyle(
      //     color: AppColors.blue, fontWeight: FontWeight.w500, fontSize: 14),
      // unselectedLabelStyle: TextStyle(
      //     color: AppColors.darkGrey,
      //     fontWeight: FontWeight.w500,
      //     fontSize: 14),
      // onTap: (index) {
      //   setState(() {
      //     currentIndex = index;
      //   });
      // },
      // items: [
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.home),
      //   label: "home",
      // ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.chat),
      //   label: "chat",
      // ),
      // BottomNavigationBarItem(icon: Icon(Icons.sell), label: "sell",),
      // BottomNavigationBarItem(icon: Icon(Icons.ads_click), label: "ads"),
      // BottomNavigationBarItem(
      //     icon: Icon(Icons.business), label: "business"),
      // ]),
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
              // pages[currentIndex],
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                // height: 60,
                width: size.width * .40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: AppColors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.format_list_bulleted,
                      size: 24,
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Filter",
                      style: AppTextStyles.textStyleNormalBodySmall
                          .copyWith(color: AppColors.grey),
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
                      border: Border.all(width: 2, color: AppColors.grey)),
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
                                    .copyWith(color: AppColors.grey),
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
                            color: AppColors.grey,
                          ),
                          Text(
                            "Tel: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Container(
                            height: 35,
                            width: 3,
                            color: AppColors.grey,
                          ),
                          Text(
                            "Likes: 0",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Container(
                            height: 35,
                            width: 3,
                            color: AppColors.grey,
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
