import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text-styles.dart';

// ignore: must_be_immutable
class ItemContainer extends StatelessWidget {
  ItemContainer(
      {super.key,
      required this.imageLink,
      required this.titleText,
      required this.category,
      required this.subcategory,
      this.ontap});
  var imageLink, titleText, ontap, category = "", subcategory = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border(
            left: BorderSide(color: AppColors.black),
            top: BorderSide(color: AppColors.black),
            right: BorderSide(color: AppColors.black),
            bottom: BorderSide(color: AppColors.black),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "From: 23 May 2023",
            style: AppTextStyles.textStyleSubtitleSmallBody,
          ),
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InkWell(
                  onTap: ontap,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      image: DecorationImage(
                          image: NetworkImage(imageLink), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ]),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: AppTextStyles.textStyleTitleBodyMedium,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rs:',
                          style: AppTextStyles.textStyleSubtitleSmallBody
                              .copyWith(color: AppColors.grey),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          titleText,
                          style: AppTextStyles.textStyleBoldBodyXSmall
                              .copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Category: ",
                          style: AppTextStyles.textStyleBoldXLBodySmall),
                      TextSpan(
                          text: subcategory,
                          style: AppTextStyles.textStyleNormalBodyXSmall)
                    ]))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // rowww
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Views: ",
                    style: AppTextStyles.textStyleBoldXLBodySmall),
                TextSpan(
                    text: "0", style: AppTextStyles.textStyleSubtitleSmallBody),
              ])),
              Container(
                height: 25,
                width: 3,
                color: AppColors.black,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Tel: ",
                    style: AppTextStyles.textStyleBoldXLBodySmall),
                TextSpan(
                    text: "0", style: AppTextStyles.textStyleSubtitleSmallBody),
              ])),
              Container(
                height: 25,
                width: 3,
                color: AppColors.black,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Likes: ",
                    style: AppTextStyles.textStyleBoldXLBodySmall),
                TextSpan(
                    text: "0", style: AppTextStyles.textStyleSubtitleSmallBody),
              ])),
              Container(
                height: 25,
                width: 3,
                color: AppColors.black,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Chat: ",
                    style: AppTextStyles.textStyleBoldXLBodySmall),
                TextSpan(
                    text: "0", style: AppTextStyles.textStyleSubtitleSmallBody),
              ])),
            ],
          ),
        ],
      ),
    );
  }
}
