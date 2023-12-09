import 'package:bhai_chara/common/buttons/custom_button.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/authentication/create_password.dart';
import 'package:flutter/material.dart';

import '../../common/containers/custom_container_tile.dart';
import '../../utils/text-styles.dart';

class SignupByEmail extends StatefulWidget {
  const SignupByEmail({super.key});

  @override
  State<SignupByEmail> createState() => _SignupByEmailState();
}

class _SignupByEmailState extends State<SignupByEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Container(
              height: size.height * .95,
              padding: EdgeInsets.all(10),
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
                        width: 150,
                        decoration: const BoxDecoration(
                            // color: AppColors.primary,
                            // color: AppColors.White,
                            image: DecorationImage(
                                scale: 1,
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.contain)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Enter your Detail",
                    style: AppTextStyles.textStyleBoldSubTitleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Text(
                    "Your Details is the most secure method to verify your Account",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyleNormalBodyXSmall,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    // height: 60.0,
                    labeltext: "Full Name",
                    obsecuretext: false,
                    width: size.width,
                    controller: nameController,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    // height: 60.0,
                    labeltext: "E-mail",
                    obsecuretext: false,
                    width: size.width,
                    controller: emailController,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.grey)),
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      if (nameController.text.isEmpty) {
                        showSnack(
                            context: context,
                            text: "Enter please Your Full Name");
                      } else if (emailController.text.isEmpty) {
                        showSnack(
                            context: context, text: "Enter please Your Email");
                      } else if (!emailController.text.contains("@") &&
                          !emailController.text.contains(".com")) {
                        showSnack(
                            context: context, text: "Enter correct email");
                      } else {
                        push(
                            context,
                            CreatePassword(
                              emailController: emailController.text,
                              fullName: nameController.text,
                            ));
                      }
                    },
                    text: "Next",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
