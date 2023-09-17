import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/common/custom_navigation_bar.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../../common/custom_appbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBar(
            title_text: "Account",
          )),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomListAccountTile(
              asset_image: AssetImage("assets/images/profile_photo.png"),
              subtitle_text: "View and edit profile",
              subtitle_style: AppTextStyles.textStyleSubtitleUnderlineBody,
              title_style: AppTextStyles.textStyleBoldBodyMedium,
              title_text: "Arham Sarwar",
            ),
            const SizedBox(
              height: 50,
            ),
            CustomListTile(
              back_color: AppColors.primary,
              circularwidget: Icon(
                Icons.settings,
                size: 30,
                color: AppColors.black,
              ),
              titletext: "Settings",
              titleStyle: AppTextStyles.textStyleBoldBodyMedium,
              subtitleText: "Privacy and Manage Account",
              subtitleStyle: AppTextStyles.textStyleSubtitleSmallBody,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            CustomListTile(
              back_color: AppColors.primary,
              circularwidget: Icon(
                Icons.help,
                size: 30,
                color: AppColors.black,
              ),
              titletext: "Help & Support",
              titleStyle: AppTextStyles.textStyleBoldBodyMedium,
              subtitleText: "Help center and legal terms",
              subtitleStyle: AppTextStyles.textStyleSubtitleSmallBody,
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
