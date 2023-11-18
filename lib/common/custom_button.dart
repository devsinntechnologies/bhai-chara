import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      this.text,
      this.width,
      this.colorBox = AppColors.blue});
  var onTap, text, height = 50.0, width, colorBox;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (width == null) {
      width = size.width;
    }
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.textStyleNormalBodyMedium
                  .copyWith(color: AppColors.white),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: colorBox),
        ));
  }
}
