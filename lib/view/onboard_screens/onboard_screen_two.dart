import 'package:bhai_chara/common/buttons/custom_button.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_three.dart';
import 'package:flutter/material.dart';

import '../../common/bulit.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class OnboardScreenTwo extends StatefulWidget {
  const OnboardScreenTwo({super.key});

  @override
  State<OnboardScreenTwo> createState() => _OnboardScreenTwoState();
}

class _OnboardScreenTwoState extends State<OnboardScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 35.0, horizontal: 25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 114,
                      width: 90,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Connecting Hearts",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: Image(
                        image: AssetImage("assets/images/onboard2.png"),
                        //height: 350,
                        width: 270,
                      ),
                    ),
                    Text(
                      "Where Brotherhood Flourishes",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 15),
                      child: Text(
                        "Bhai Chara is a place where hearts connect, and differences dissolve. Engage in meaningful conversations, share stories, and build lifelong bonds.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyleNormalBodySmall.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builit.UnSelectBulit,
                          Builit.SelectedBulit,
                          Builit.UnSelectBulit,
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        push(context, const OnboardScreenThree());
                      },
                      text: "Next",
                    ),
                  ]),
            ),
          )),
    );
  }
}
