// ignore_for_file: unused_local_variable

import 'dart:async';

<<<<<<< Updated upstream
import 'package:bhai_chara/utils/push.dart';
=======
>>>>>>> Stashed changes
import 'package:bhai_chara/view/onboard_screens/onboard_screen_one.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/push.dart';
import '../../utils/text-styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
<<<<<<< Updated upstream
    var _duration = const Duration(seconds: 55);
    return Timer(_duration, push(context, OnboardScreenOne()));
=======
    var _duration = const Duration(seconds: 5);
    return Timer(_duration,pushUntil(context, OnboardScreenOne()));
>>>>>>> Stashed changes
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/image.png"),
                height: 221,
                width: 175,
              ),
              Text(
                "BHAI CHARA",
                style: AppTextStyles.textStyleBoldBodyMedium
                    .copyWith(color: AppColors.blue),
              ),
              Text(
                "STRONGER TOGETHER",
                style: AppTextStyles.textStyleNormalBodyXSmall
                    .copyWith(color: AppColors.blue),
              )
            ],
          ),
        ));
  }
}
