



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/bulit.dart';
import '../../common/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';
import 'onboard_screen_three.dart';
import 'onboard_screen_two.dart';

class OnboardScreenThree extends StatelessWidget {
  const OnboardScreenThree({super.key});

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
                
                Text("Empowering Together",
                 textAlign: TextAlign.center,
                    style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(
                    color: AppColors.white,
                  ),),
                Image(
                  image: AssetImage("assets/images/onboard3.png"),
                  height: 350,
                  width: 270,
                ),
                Text(
                  "Uniting for Progress", textAlign: TextAlign.center,
                  style: AppTextStyles.textStyleNormalBodyMedium.copyWith(
                    color: AppColors.blue,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 23,vertical: 15),
                  child: Text(
                    "In the spirit of Bhai Chara, we empower each other to grow and succeed. Explore opportunities to collaborate, contribute, and uplift our community.",
                   textAlign: TextAlign.center,
                   
                    style: AppTextStyles.textStyleNormalBodySmall
                        .copyWith(color: AppColors.grey,),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Builit.UnSelectBulit,
                  Builit.UnSelectBulit,
                      Builit.SelectedBulit,
                    ],
                  ),
                ),
                SizedBox(height: 30,),
              
                SizedBox(height: 30,)
              ]),
        ),
      ),
    ));
  }
}
