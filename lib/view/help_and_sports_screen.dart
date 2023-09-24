import 'package:bhai_chara/utils/push.dart';
import 'package:flutter/material.dart';

import '../common/custom_container.dart';
import '../common/custom_listtile.dart';
import '../utils/app_colors.dart';

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
          CustomContainer(context, "Help And Supports"),
          const SizedBox(
            height: 30,
          ),
          Padding(
             padding:const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomListTileSetting(
                  tap: () {
                    BottomSheetFunction(context);
                  },
                  heading: "Feedback",
                  data: 'Take a moment to let us konw how we’re doing',
                  iconTwo: Icons.arrow_forward_ios,
                ),
                CustomListTileSetting(
                  tap: () {},
                  heading: "Invite friends to Bhai Chara",
                  data: 'Invite your friends to buy and sell',
                  iconTwo: Icons.arrow_forward_ios,
                ),
                CustomListTileSetting(
                  tap: () {},
                  heading: "Version",
                  data: '23.1',
                  iconTwo: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
