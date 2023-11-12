import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomContainerTile extends StatelessWidget {
  CustomContainerTile(
      {super.key,
      this.image,
      this.text,
      this.style_text,
      this.chil_widget,
      this.ontap,
      this.width = double.infinity,
      this.height = 50.0,
     // required Null Function() tap
      });
  var image, text, chil_widget;
  var height, ontap;
  var width, style_text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // flex: 1,
                child: Container(
                  height: 20,
                  width: 20,
                  child: image != null
                      ? Image(
                          image: AssetImage("$image"),
                          fit: BoxFit.contain,
                        )
                      : chil_widget,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "$text",
                  style: style_text == null
                      ? AppTextStyles.textStyleBoldXLBodySmall
                      : style_text,
                ),
              ),

              // SizedBox(),/
              // Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

//    Text Form Field     //
// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      this.maxlength,
      required this.hint_text,
      required this.border,
      this.alignment,
      this.keyboard_type});
  var controller,
      maxlength = null,
      alignment,
      hint_text = "",
      border = InputBorder.none,
      keyboard_type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: keyboard_type == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      keyboardType: keyboard_type,
      textAlign: alignment,
      maxLength: maxlength,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          border: border,
          hintText: hint_text,
          counterText: " ",
          hintStyle: AppTextStyles.textStyleBoldBodyMedium),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.height,
      this.width,
      required this.controller,
      required this.border,
      this.suffixIcon,
      this.suffixIconColor,
      this.hintText,
      required this.obsecuretext,
      this.prefixcolor,
      this.prfixicon,
      this.labeltext,
      this.keyboardtype = TextInputType.text
      // this.pad_left = 20,
      // this.pad_bottom,
      // this.pad_right,
      // this.pad_top,
      });
  dynamic height,
      width,
      controller,
      border,
      suffixIcon,
      suffixIconColor,
      hintText,
      prfixicon,
      prefixcolor,
      keyboardtype,
      labeltext;
  bool obsecuretext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: height,
            width: width,
            child: TextField(
              obscureText: obsecuretext,
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: AppColors.black),
              maxLines: 1,
              keyboardType: keyboardtype,
              inputFormatters: keyboardtype == TextInputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 20,
                  ),
                  border: border,
                  prefixIcon: prfixicon,
                  prefixIconColor: prefixcolor,
                  suffixIcon: suffixIcon,
                  suffixIconColor: suffixIconColor,
                  hintText: hintText,
                  labelText: labeltext,
                  // labelStyle: TextStyle(color: AppColors.blue, fontSize: 17),
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey)),
            )),
      ],
    );
  }
}
