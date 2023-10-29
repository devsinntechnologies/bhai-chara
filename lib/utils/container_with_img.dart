import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class CustomContainerBox extends StatelessWidget {
  final text, secondText, imgLink, ontap, isfree;
  CustomContainerBox(
      {required this.text,
      required this.imgLink,
      required this.secondText,
      required this.ontap,
      required this.isfree});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        height: 250,
        width: 250,
        //  width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 115,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imgLink,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: AppTextStyles.textStyleBoldBodySmall,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  secondText,
                  style: AppTextStyles.textStyleBoldBodyXSmall,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  isfree ? "Free" : "Paid",
                  style: isfree
                      ? AppTextStyles.textStyleBoldBodyXSmall
                          .copyWith(color: AppColors.Green)
                      : AppTextStyles.textStyleBoldBodyXSmall
                          .copyWith(color: AppColors.yellow),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
