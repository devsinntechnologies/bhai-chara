import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.App,
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   // color: AppColors.primary,
        //   color: AppColors.primary,
        //   size: 24,
        // ),
        title: Text(
          "Account",
          style: AppTextStyles.textStyleNormalLargeTitle
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  // 1columnn...
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: AppColors.primary,
                        backgroundImage: AssetImage(
                          "images/lining.jpg",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  // 2 columnnn
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Arham Sarvar",
                        style: AppTextStyles.textStyleBoldSubTitleLarge,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "View and edit profile",
                        style: AppTextStyles.textStyleNormalBodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              // 2 row
              for (int i = 0; i < 3; i++)
                Column(
                  children: [
                    //row koo wrap kiya column maiii   lop use kenay kai liyay
                    Row(
                      children: [
                        //1 columnnn
                        Column(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 24,
                              color: AppColors.TextColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        //2 columnnn
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Settings",
                              style: AppTextStyles.textStyleBoldBodyMedium,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Privacy and manage account ",
                              style: AppTextStyles.textStyleNormalBodyXSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xffE6E6E6),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
