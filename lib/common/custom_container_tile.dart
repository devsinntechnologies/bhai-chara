import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      this.maxlength,
      required this.hint_text,
      required this.border});
  var controller, maxlength = null, hint_text = "", border = InputBorder.none;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      maxLength: maxlength,
      controller: controller,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10, bottom: 3),
        border: border,
        hintText: hint_text,
        counterText: " ",
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
