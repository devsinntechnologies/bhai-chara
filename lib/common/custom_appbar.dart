import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.leading_widget, this.title_text});
  var title_text, leading_widget = null;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.appbar,
        leading: leading_widget,
        title: Text(title_text),
        titleTextStyle: AppTextStyles.textStyleTitleBodyMediumWhiteColor);
  }
}
