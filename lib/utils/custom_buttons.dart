import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomButton extends StatelessWidget {
  final text, icon;
  CustomButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 62,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBlue),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.darkBlue,
              size: 24,
            ),
            Text(
              text,
              style: AppTextStyles.textStyleBoldBodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
