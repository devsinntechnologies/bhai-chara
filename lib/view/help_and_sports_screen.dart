import 'package:bhai_chara/utils/push.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/container.dart';
import '../utils/listtile_custom.dart';

class HelpAndSportsScreen extends StatefulWidget {
  const HelpAndSportsScreen({super.key});

  @override
  State<HelpAndSportsScreen> createState() => _HelpAndSportsScreenState();
}

class _HelpAndSportsScreenState extends State<HelpAndSportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          CustomContainer(
            text: 'Help and Supports',
            iconVar: Icons.arrow_back_ios,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomListTile(
                  tap: () {
                    BottomSheetFunction(context);
                  },
                  title: "Feedback",
                  subtitle: "Take a moment to let us konw how we’re doing",
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                CustomListTile(
                  tap: () {
                    //push(context, ManageAccountScreen());
                  },
                  title: "Invite friends to Bhai Chara",
                  subtitle: "Invite your friends to buy and sell",
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                CustomListTile(
                  tap: () {
                    //push(context, ManageAccountScreen());
                  },
                  title: "Version",
                  subtitle: "23.1",
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
