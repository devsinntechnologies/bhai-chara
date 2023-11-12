import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';

import '../../common/bulit.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class OnboardScreenThree extends StatefulWidget {
  const OnboardScreenThree({super.key});

  @override
  State<OnboardScreenThree> createState() => _OnboardScreenThreeState();
}

class _OnboardScreenThreeState extends State<OnboardScreenThree> {
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
                      "Empowering Together",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: Image(
                        image: AssetImage("assets/images/onboard3.png"),
                        //height: 350,
                        width: 270,
                      ),
                    ),
                    Text(
                      "Uniting for Progress",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 15),
                      child: Text(
                        "In the spirit of Bhai Chara, we empower each other to grow and succeed. Explore opportunities to collaborate, contribute, and uplift our community.",
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
                          Builit.UnSelectBulit,
                          Builit.SelectedBulit,
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        pushUntil(context, const LoginScreen());
                      },
                      text: "Next",
                    ),
                  ]),
            ),
          )),
    );
  }
}
