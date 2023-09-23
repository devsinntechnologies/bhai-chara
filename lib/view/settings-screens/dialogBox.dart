import 'package:bhai_chara/common/Custom_button_small.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
     // backgroundColor: AppColors.grey,
      content: Container(
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.delete, color: AppColors.blue),
            Text("Are you sure?", style: AppTextStyles.textStyleBoldBodySmall),
            Text(
              "All your ads will be set to inactive and will not be \nshowing to the users.",
              style: AppTextStyles.textStyleNormalBodyXSmall,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonSmall(
                    height: 40,
                    color: AppColors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Cancel",
                    fontcolor: AppColors.white),
              
               CustomButtonSmall(
                    height: 40,
                    color: AppColors.blue,
                    onPressed: () {
                     // Navigator.pop(context);
                    },
                    text: "Delete",
                    fontcolor: AppColors.white),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      ),
   
   
   
    );
  }
}
