import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Widget BuildTextMesg(String ch) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 15,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ch, style: AppTextStyles.textStyleNormalBodyXSmall),
              Text("1:26",
                  style: AppTextStyles.textStyleNormalBodyXSmall
                      .copyWith(fontSize: 10, color: AppColors.grey))
            ],
          ),
        ),
      ],
    ),
  );
}

Widget BuildReceiveMesg(String ch) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(right: 15, left: 150, top: 10, bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.skyblue,
        ),
       child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ch, style: AppTextStyles.textStyleNormalBodyXSmall),
              Text("1:26",
                  style: AppTextStyles.textStyleNormalBodyXSmall
                      .copyWith(fontSize: 10, ))
            ],
          ),
      ),
    ],
  );
}
