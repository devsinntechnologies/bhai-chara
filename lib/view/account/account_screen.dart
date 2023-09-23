import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/help_and_sports_screen.dart';
import 'package:bhai_chara/view/settings-screens/setting_screen.dart';

import 'package:flutter/material.dart';

import '../../common/custom_appbaar.dart';
import '../../common/custom_listtile.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainer(context, 'Account'),
          const SizedBox(
            height: 30,
          ),
          CustomListAccountTile(
            asset_image: const AssetImage("assets/images/profile_photo.png"),
            subtitle_text: "View and edit profile",
            subtitle_style: AppTextStyles.textStyleSubtitleUnderlineBody,
            title_style: AppTextStyles.textStyleBoldBodyMedium,
            title_text: "Arham Sarwar",
          ),
          const SizedBox(
            height: 50,
          ),
          CustomListTileSetting(
             tap: (){
              push(context, const SettingScreen());
             },
            heading: "Settings",
            data: 'privacy and manage account',
            iconOne: Icons.settings,
          ),
          CustomListTileSetting(
             tap: (){
              push(context, const HelpAndSportsScreen());
             },
            heading: "Help and Supports",
            data: 'Help center and legal terms',
            iconOne: Icons.help,
          )
        ],
      ),
    );
  }
}
