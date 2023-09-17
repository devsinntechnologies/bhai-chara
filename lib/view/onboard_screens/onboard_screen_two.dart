import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/bulit.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class OnboardScreenTwo extends StatelessWidget {
  const OnboardScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 114,
                      width: 90,
                    ),
                    Text(
                      "Connecting Hearts",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/images/onboard2.png"),
                      height: 350,
                      width: 270,
                    ),
                    Text(
                      "Where Brotherhood Flourishes",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23, vertical: 15),
                      child: Text(
                        "Bhai Chara is a place where hearts connect, and differences dissolve. Engage in meaningful conversations, share stories, and build lifelong bonds.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyleNormalBodySmall.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builit.UnSelectBulit,
                          Builit.SelectedBulit,
                          Builit.UnSelectBulit,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ),
        ));
  }
}
