import 'package:flutter/material.dart';

import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';

Widget CustomContainer(context, text) {
  return Container(
    height: 80,
    width: double.infinity,
    color: AppColors.black,
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyles.textStyleNormalBodyMedium
              .copyWith(color: AppColors.white),
        )
      ],
    ),
  );
}
