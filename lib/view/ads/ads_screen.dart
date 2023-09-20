import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../common/custom_appbar.dart';
import '../../utils/text-styles.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBar(
            title_text: "Ads",
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                tap: () {},
                height_contianer: 40,
                width_container: 100,
                chil_widget: Icon(
                  Icons.tune,
                  size: 20,
                  color: AppColors.grey,
                ),
                text: "Filter",
                style_text: AppTextStyles.textStyleNormalXLBodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < 3; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border(
                        left: BorderSide(width: 5, color: AppColors.black),
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
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/car_product.png")),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ]),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Car",
                                  style: AppTextStyles.textStyleTitleBodyMedium,
                                ),
                                Text(
                                  "Rs 1,000,00",
                                  style: AppTextStyles
                                      .textStyleSubtitleSmallBody
                                      .copyWith(color: AppColors.grey),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Category: ",
                                      style: AppTextStyles
                                          .textStyleBoldXLBodySmall),
                                  TextSpan(
                                      text: " Car",
                                      style: AppTextStyles
                                          .textStyleNormalBodyXSmall)
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
                                text: "0",
                                style:
                                    AppTextStyles.textStyleSubtitleSmallBody),
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
                                text: "0",
                                style:
                                    AppTextStyles.textStyleSubtitleSmallBody),
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
                                text: "0",
                                style:
                                    AppTextStyles.textStyleSubtitleSmallBody),
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
                                text: "0",
                                style:
                                    AppTextStyles.textStyleSubtitleSmallBody),
                          ])),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
