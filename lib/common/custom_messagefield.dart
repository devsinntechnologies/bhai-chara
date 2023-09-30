import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Widget BuildTextMesg(String ch) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const CircleAvatar(
            radius: 15,
          ),
          const SizedBox(width: 5),
          Text("@Kashaf", style: AppTextStyles.textStyleNormalBodyXSmall),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(right: 50, top: 5, bottom: 5, left: 35),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightblue),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(9),
            bottomRight: Radius.circular(9),
            bottomLeft: Radius.circular(9),
          ),
          color: AppColors.white,
        ),
        child: Text(ch,
            softWrap: true, style: AppTextStyles.textStyleNormalBodySmall),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 35.0, bottom: 20),
        child: Text("1:26 AM",
            style: AppTextStyles.textStyleNormalBodyXSmall.copyWith()),
      )
    ],
  );
}

Widget BuildReceiveMesg(String ch) {
  return Align(
    alignment: Alignment.topRight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50, top: 10, bottom: 5),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blue),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(9),
              bottomRight: Radius.circular(9),
              bottomLeft: Radius.circular(9),
            ),
            color: AppColors.skyblue,
          ),
          child: Text(ch,
              textAlign: TextAlign.left,
              softWrap: true,
              style: AppTextStyles.textStyleNormalBodySmall),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0, bottom: 20),
          child: Text("1:26 AM",
              style: AppTextStyles.textStyleNormalBodyXSmall.copyWith()),
        )
      ],
    ),
  );
}
