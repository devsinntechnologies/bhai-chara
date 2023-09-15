import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/utils/utils.dart';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomContainer extends StatelessWidget {
  final iconVar, text;
  CustomContainer({this.iconVar, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: AppColors.darkBlue),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {
                pop(context);
              },
              icon: Icon(
                iconVar,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(text,
                  style: AppTextStyles.textStyleBoldBodyMedium.copyWith(
                    color: AppColors.White,
                  )))
        ],
      ),
    );
  }
}
