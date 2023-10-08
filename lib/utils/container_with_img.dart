import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final text, secondText, imgLink, ontap;
  CustomContainer(
      {required this.text,
      required this.imgLink,
      required this.secondText,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 205,
        width: 185,
        //  width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image(
            image: imgLink,
            height: 131,
            width: 185,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child:
                      Text(text, style: AppTextStyles.textStyleBoldBodySmall)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(secondText,
                      style: AppTextStyles.textStyleBoldBodyXSmall)),
            ],
          )
        ]),
      ),
    );
  }
}
