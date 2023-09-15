import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
class CustomList extends StatelessWidget {
  var text;
  CustomList({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(radius: 5,backgroundColor: AppColors.black,),
      ),
  Container(
    width: double.infinity,
    child: Text(text,style: AppTextStyles.textStyleNormalBodyXSmall,))
    ],);
  }
}