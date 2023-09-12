import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../common/custom_container_tile.dart';
import '../../utils/text-styles.dart';

class SignupByEmail extends StatefulWidget {
  const SignupByEmail({super.key});

  @override
  State<SignupByEmail> createState() => _SignupByEmailState();
}

class _SignupByEmailState extends State<SignupByEmail> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      image: const DecorationImage(
                          scale: 1,
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Enter your email",
              style: AppTextStyles.textStyleBoldSubTitleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              "We will send a confirmation code to your email",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleNormalBodyXSmall,
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomTextField(
                      obsecuretext: false,
                      height: 30,
                      width: size.width * .80,
                      controller: emailController,
                      border: InputBorder.none,
                      hintText: "Email"),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                //fuctionality
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.blue),
                  child: Center(
                    child: Text(
                      "Next",
                      style: AppTextStyles.textStyleNormalBodySmall_WhiteColor,
                    ),
                  )),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
