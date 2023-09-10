import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class CustomContainerTile extends StatelessWidget {
  CustomContainerTile({super.key, this.image, this.text});
  var image, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                height: 20,
                width: 20,
                child: Image(
                  image: AssetImage("$image"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "$text",
                style: AppTextStyles.textStyleBoldXLBodySmall,
              ),
            ),
            SizedBox(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
