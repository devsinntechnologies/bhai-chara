import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text-styles.dart';

// ignore: must_be_immutable
class CustomButtonCreatePassword extends StatelessWidget {
  var text;
  CustomButtonCreatePassword({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blue)),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
            color: AppColors.White,
          ),
        ),
      ),
    );
  }
}
