import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, this.text});
  var onTap, text;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: size.width,
          child:  Center(
            child: Text(
              text,
              style: AppTextStyles.textStyleNormalBodyMedium
                  .copyWith(color: AppColors.white),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColors.blue),
        ));
  }
}
