import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/listtile_custom.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/settings-screens/create_pasward_screen.dart';
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
     
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            CustomContainer(context, "Setting"),
            SizedBox(
              height: 30,
            ),
        
          
            Column(
              
              children: [
                CustomListTile(
                  tap: (){
                    push(context, CreatePasswardScreen());
                  },
                  title: "Privacy",
                  subtitle: "Phone number visibility",
                ),
                
                Divider(
                  thickness: 2,
                  color:AppColors.dividerColor ,
                ),
                 CustomListTile(
                  tap: (){
                    push(context, CreatePasswardScreen());
                  },
                  title: "Privacy",
                  subtitle: "Phone number visibility",
                ),
                
                Divider(
                  thickness: 2,
                  color:AppColors.dividerColor ,
                ),
                 CustomListTile(
                  tap: (){
                    push(context, CreatePasswardScreen());
                  },
                  title: "Privacy",
                  subtitle: "Phone number visibility",
                ),
                
                Divider(
                  thickness: 2,
                  color:AppColors.dividerColor ,
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
 
  }
}
