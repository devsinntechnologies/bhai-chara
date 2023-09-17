import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.leading_widget, this.title_text});
  var title_text, leading_widget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.appbar,
      title: CustomText(
        text: title_text,
        fontsize: 26,
        fontweight: FontWeight.normal,
        color: AppColors.primary,
      ),
      leading: leading_widget,
    );
  }
}
