import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/text-styles.dart';

// ignore: must_be_immutable
class CustomContainerText extends StatelessWidget {
  CustomContainerText({super.key, this.text});
  var text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textStyleNormalBody_BlackColor,
        ),
      ),
    );
  }
}
