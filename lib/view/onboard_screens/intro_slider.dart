// import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/authentication/login_screen.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_one.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_three.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_two.dart';
import 'package:flutter/material.dart';

// class IntroSlider extends StatefulWidget {
//   const IntroSlider({super.key});

//   @override
//   State<IntroSlider> createState() => _IntroSliderState();
// }

// class _IntroSliderState extends State<IntroSlider> {
//   PageController controller = PageController();
//   // ignore: use_function_type_syntax_for_parameters

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class IntroSlider extends StatefulWidget {
  IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  List pageViewItem = [
    OnboardScreenOne(),
    OnboardScreenTwo(),
    OnboardScreenThree(),
    LoginScreen()
  ];
  addListner() {
    controller.addListener(() {
      // setState method to
      // rebuild the widget
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    addListner();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: pageViewItem.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (context, position) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: pageViewItem[position],
          );
        });
  }
}
