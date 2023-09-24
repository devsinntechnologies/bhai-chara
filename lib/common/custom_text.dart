
import 'package:flutter/material.dart';
import '../utils/text-styles.dart';

class CustomText extends StatelessWidget {
  var text, tap;
   CustomText({super.key, required this.text, required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Text(text, style: AppTextStyles.textStyleNormalBodyMedium));
  }
}
