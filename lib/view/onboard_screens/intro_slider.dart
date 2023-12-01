// import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/authentication/login_screen.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_one.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_three.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_two.dart';
import 'package:flutter/material.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnboardScreenOne(),
        OnboardScreenTwo(),
        OnboardScreenThree(),
        LoginScreen(),
      ],
    );
  }
}
