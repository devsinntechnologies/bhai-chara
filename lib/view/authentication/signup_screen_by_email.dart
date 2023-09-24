import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/authentication/create_password.dart';
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
      body: Container(
        padding:const EdgeInsets.all(20),
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
                  decoration: const BoxDecoration(
                      // color: AppColors.primary,
                      color: AppColors.white,
                      image: DecorationImage(
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
            Text(
              "We will send a confirmation code to your email",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleNormalBodyXSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                height: 60.0,
                obsecuretext: false,
                width: size.width,
                controller: emailController,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(color: AppColors.grey)),
                hintText: "Email"),

            const Spacer(),
            CustomButton(
              onTap: () {
                if (emailController.text.isEmpty) {
                  showSnack(context: context);
                } else {
                  push(context,const CreatePassword());
                }
              },
              text: "Next",
            )
            // CustomButton(
            //   onTap: push(context, CreatePassword()),
            //   text: "Next",
            // ),
            // InkWell(
            //   onTap: () {
            //     //fuctionality
            //   },
            //   child: Container(
            //       height: 50,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: AppColors.blue),
            //       child: Center(
            //         child: Text(
            //           "Next",
            //           style: AppTextStyles.textStyleNormalBodySmall_WhiteColor,
            //         ),
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
