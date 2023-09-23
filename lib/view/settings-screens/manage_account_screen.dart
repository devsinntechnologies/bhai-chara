import 'package:bhai_chara/view/settings-screens/dialogBox.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
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
          "Manage Account",
          style: AppTextStyles.textStyleBoldBodyMedium
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: size.width,
              child: Center(
                  child: Text(
                "Logout",
                style: AppTextStyles.textStyleBoldBodyMedium,
              )),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.blue,
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: AppColors.dividerColor,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                 showDialog(
                context: context,
                builder: (
                  context,
                ) {
                  return DialogBox();
                });
              },
              child: ListTile(
                title: Text("Delete Account",
                    style: AppTextStyles.textStyleBoldBodyMedium),
                trailing: IconButton(
                  onPressed: (){
                     showDialog(
        context: context,
        builder: (
          context,
        ) {
          return DialogBox();
        });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    
                    color: AppColors.TextColor,
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
