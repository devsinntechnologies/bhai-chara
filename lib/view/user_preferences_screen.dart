import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.App,
        leading: Icon(
          Icons.arrow_back_ios,
          // color: AppColors.primary,
          color: AppColors.primary,
          size: 24,
        ),
        title: Text(
          "User Preferences",
          style: AppTextStyles.textStyleNormalLargeTitle
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Font size",
              style: AppTextStyles.textStyleBoldBodyMedium,
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text("A",style: AppTextStyles.textStyleBoldBodySmall,),
                SizedBox(width: 20,),
                Container(
                  height: 10,
                  width: size.width*.68,
                  color: AppColors.dividerColor,
                
                  //  Container(
                  //   height: 10,
                  //   width: size.width * .40,
                  //   color: AppColors.blue,
                  // ),
                ),
                 SizedBox(width: 20,),
                 Text("A",style: AppTextStyles.textStyleBoldSubTitleLarge,),
              ],
            ),
            // LinearProgressIndicator(
            //   backgroundColor: AppColors.dividerColor,
            //   color: AppColors.blue,
            //   minHeight: 8,

            // ),
          ],
        ),
      ),
    );
  }
}
