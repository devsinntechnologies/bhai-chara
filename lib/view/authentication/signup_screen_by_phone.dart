import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_email.dart';

import 'package:flutter/material.dart';

import '../../common/custom_button.dart';

class SignUpScreenByPhone extends StatefulWidget {
  const SignUpScreenByPhone({super.key});

  @override
  State<SignUpScreenByPhone> createState() => _SignUpScreenByPhoneState();
}

class _SignUpScreenByPhoneState extends State<SignUpScreenByPhone> {
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                    decoration: const BoxDecoration(
                        color: AppColors.primary,
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
                "Enter your phone",
                style: AppTextStyles.textStyleBoldSubTitleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "We will send a confirmation code to your phone",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyleNormalBodyXSmall,
              )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: const Image(
                        image: AssetImage("assets/images/pakistan.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "+92",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: AppColors.light_black,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3),
                      child: CustomTextField(
                        width: size.width * .60,
                        controller: numberController,
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        obsecuretext: false,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (numberController.text.isEmpty) {
                    showSnack(context: context);
                  } else {
                    push(context, SignupByEmail());
                  }
                },
                text: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
