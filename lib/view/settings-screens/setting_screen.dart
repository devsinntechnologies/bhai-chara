import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/listtile_custom.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/settings-screens/create_pasward_screen.dart';
import 'package:bhai_chara/view/settings-screens/manage_account_screen.dart';
import 'package:bhai_chara/view/settings-screens/privacyScreen.dart';
import 'package:bhai_chara/view/settings-screens/user_preferences_screen.dart';
import 'package:flutter/material.dart';

import '../../common/custom_appbaar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          CustomContainer(context, "Setting"),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomListTile(
                  tap: () {
                    push(context,const  PrivacyScreen());
                  },
                  title: "Privacy",
                  subtitle: "Phone number visibility",
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                CustomListTile(
                  tap: () {
                    push(context, ManageAccountScreen());
                  },
                  title: "Manage account",
                  subtitle: "Take action on account",
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                CustomListTile(
                  tap: () {
                    push(context, UserPreferencesScreen());
                  },
                  title: "User Preferences",
                  subtitle: "Customize appearance",
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
