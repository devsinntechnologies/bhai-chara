import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Widget BuildTextMesg(String ch) {
  return Column(
    children: [
      Row(
        children: [
          const CircleAvatar(
            radius: 15,
          ),
          Text("@ Kashaf", style: AppTextStyles.textStyleNormalBodySmall),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(right: 150, top: 10, bottom: 5),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(9),
            bottomRight: Radius.circular(9),
            topLeft: Radius.circular(9),
          ),
          color: AppColors.white,
        ),
        child: Text(ch, style: AppTextStyles.textStyleNormalBodyXSmall),
      ),
      Text("1:26 AM",
          style: AppTextStyles.textStyleNormalBodyXSmall.copyWith(
            fontSize: 10,
          ))
    ],
  );
}

Widget BuildReceiveMesg(String ch) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            //width: 200,
            margin: const EdgeInsets.only(left: 150, top: 10, bottom: 5),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration:const  BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9),
            bottomRight: Radius.circular(9),
            bottomLeft: Radius.circular(9),
          ),
              color: AppColors.skyblue,
            ),
            child: Text(ch, style: AppTextStyles.textStyleNormalBodyXSmall),
          ),
        ],
      ),
      Text("1:26 AM",
          style: AppTextStyles.textStyleNormalBodyXSmall.copyWith(
            fontSize: 10,
          ))
    ],
  );
}
