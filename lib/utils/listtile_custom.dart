import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
  });
  final title, subtitle;
  final trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.textStyleBoldBodyMedium,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.textStyleNormalBodyXSmall,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 24,
        color: AppColors.TextColor,
      ),
    );
  }
}
