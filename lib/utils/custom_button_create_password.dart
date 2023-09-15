import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text-styles.dart';

class CustomButtonCreatePassword extends StatelessWidget {
   CustomButtonCreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 30),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blue)),
      child: Text(
        "Create Password",
        style: AppTextStyles.textStyleBoldBodySmall
            .copyWith(color: AppColors.White),
      ),
    );
  }
}
