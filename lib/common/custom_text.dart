import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      this.text,
      this.fontsize,
      this.fontweight,
      this.color,
      this.decorationtext,
      this.maxlines,
      this.overflow});
  var text, fontsize, fontweight, color, decorationtext, maxlines, overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        letterSpacing: 0.5,
        fontSize: fontsize,
        fontWeight: fontweight,
        color: color,
        decoration: decorationtext,
      ),
      maxLines: maxlines,
      softWrap: true,
      overflow: overflow,
    );
  }
}
