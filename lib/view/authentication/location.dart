import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';

import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: size.width * .90,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/location_animated.png"),
                          fit: BoxFit.contain)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding:const EdgeInsets.all(20),
              child: Text(
                "Where do you want to buy/sell products",
                style: AppTextStyles.textStyleBoldBodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: size.width * .85,
              padding:const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "To unlock the full Bhai Chara experience, we need to know where to look for them.",
                style: AppTextStyles.textStyleNormalBodyXSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                push(context, RootScreen());
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: const Image(
                          image: AssetImage("assets/images/location_arrow.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Near me",
                        style:
                            AppTextStyles.textStyleNormalBodySmall_WhiteColor,
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
