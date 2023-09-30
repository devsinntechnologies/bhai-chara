import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_two.dart';
import 'package:flutter/material.dart';

import '../../common/bulit.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class OnboardScreenOne extends StatefulWidget {
  const OnboardScreenOne({super.key});

  @override
  State<OnboardScreenOne> createState() => _OnboardScreenOneState();
}

class _OnboardScreenOneState extends State<OnboardScreenOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:35.0,horizontal:25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const  Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 114,
                      width: 90,
                    ),
                 const  SizedBox(height:20),
                   Text(
                      "Welcome to Bhai Chara",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  const Padding(
                     padding:  EdgeInsets.symmetric(vertical: 50.0),
                     child:   Image(
                        image: AssetImage("assets/images/onboard1.png"),
                        //height: 350,
                        width: 270,
                      ),
                   ),
                    Text(
                      "Embrace Unity, Foster Brotherhood",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                    Padding(
                      padding:
                        const   EdgeInsets.symmetric(horizontal: 23, vertical: 15),
                      child: Text(
                        "Join a community that believes in the power of unity and brotherhood. Connect, collaborate, and make a positive impact together.",
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
                          Builit.SelectedBulit,
                          Builit.UnSelectBulit,
                          Builit.UnSelectBulit,
                        ],
                      ),
                    ),
                    
                    CustomButton(
                      onTap: () {
                        pushUntil(context, const OnboardScreenTwo());
                      },
                      text: "Next",
                    ),
                  
                  
                  ]),
            ),
          )),
    );
  }
}
