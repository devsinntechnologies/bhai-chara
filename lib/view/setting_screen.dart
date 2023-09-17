import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/listtile_custom.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.App,
        leading: Icon(
          Icons.arrow_back_ios,
          // color: AppColors.primary,
          color: AppColors.primary,
          size: 24,
        ),
        title: Text(
          "Setting",
          style: AppTextStyles.textStyleNormalLargeTitle
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // ListTile(
            //   title: Text("Privacy",style:AppTextStyles.textStyleBoldBodySmall ,),
            //   subtitle: Text("Phone number visibillity",style:AppTextStyles.textStyleNormalBodyXSmall ,),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     size: 24,
            //     color: AppColors.TextColor,
            //   ),
            // ),
            // 1 row
            // Row(
            //   children: [
            //     Column(crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //          Text(
            //           "Privacy",
            //           style: AppTextStyles.textStyleBoldBodySmall,
            //         ),
            //         SizedBox(height: 5,),
            //         Text(
            //           "Phone number visibillity",
            //           style: AppTextStyles.textStyleNormalBodyXSmall,
            //         ),
            //       ],
            //     ),
            //     Spacer(),
            //     // 2 column....
            //     Column(
            //       children: [
            //        Icon(
            //     Icons.arrow_forward_ios,
            //     size: 24,
            //     color: AppColors.TextColor,
            //   ),
            //       ],
            //     ),
            //   ],
            // )
          //  for (int i = 0 ; i<3; i++)
           for (int i = 0 ; i<3; i++)
            Column(
              
              children: [
                CustomListTile(
                  title: "Privacy",
                  subtitle: "Phone number visibility",
                  // trailing: Icon(Icons.arrow_back_ios),
                ),
                
                Divider(
                  thickness: 2,
                  color:AppColors.dividerColor ,
                ),
              ],
            ),
          
          
          
          
          
            // CustomListTile(
            //   title: "Manage account",
            //   subtitle: "Take action on account",
            //   // trailing: Icon(Icons.arrow_back_ios,),
            // ),
            // CustomListTile(
            //   title: "User Preferences",
            //   subtitle: "Customize appearance",
            //   // trailing: Icon(trailing),
            // ),
          ],
        ),
      ),
    );
 
  }
}
