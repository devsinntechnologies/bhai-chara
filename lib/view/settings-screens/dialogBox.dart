import '../../common/buttons/Custom_button_small.dart';
import 'package:bhai_chara/utils/custom_loader.dart';

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
        height: 200,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.delete, color: AppColors.blue),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Are you sure?",
                  style: AppTextStyles.textStyleBoldBodySmall),
            ),
            Text(
              "All your ads will be set to inactive and will not be showing to the users.",
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

class ErrorDialogBox extends StatelessWidget {
  final title, descrption, onTap, buttonText;
  const ErrorDialogBox(
      {super.key,
      this.onTap,
      this.descrption = "",
      this.title = "",
      this.buttonText = "OK"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: AppColors.grey,
      content: Container(
        height: 220.0,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 70, child: CustomLoader()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(title, style: AppTextStyles.textStyleBoldBodySmall),
            ),
            Text(
              descrption,
              style: AppTextStyles.textStyleNormalBodyXSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonSmall(
                    height: 40.0,
                    color: AppColors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Cancel",
                    fontcolor: AppColors.white),
                CustomButtonSmall(
                    height: 40.0,
                    color: AppColors.blue,
                    onPressed: onTap,
                    text: buttonText,
                    fontcolor: AppColors.white),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
