import 'dart:ui';

import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

Widget CustomButton(var ontap) {
  return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            "Next",
            style: AppTextStyles.textStyleNormalBodyMedium
                .copyWith(color: AppColors.white),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.blue),
      ));
}
