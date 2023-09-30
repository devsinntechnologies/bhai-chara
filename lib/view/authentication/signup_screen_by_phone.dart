import 'package:bhai_chara/common/custonPhoneTextField.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/otp_code_screen.dart';

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
    // ignore: unused_local_variable
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
                    width: 150,
                    decoration: const BoxDecoration(
                        // color: AppColors.primary,
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
              CustomCountryPhoneField(
                controller: numberController,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (numberController.text.isEmpty) {
                    showSnack(context: context);
                  }else if(numberController.text.length < 10){
                      showSnack(context: "invalid phone number");
                  } 
                  
                  else {
                    push(context, OTPScreen(phone:numberController.text));
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
