import 'package:bhai_chara/common/custonPhoneTextField.dart';
import 'package:bhai_chara/controller/provider/authentication_provider/firebase_signup_provider.dart';
import 'package:bhai_chara/provider/firebase/phone_number.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/otp_code_screen.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_button.dart';
import '../../utils/custom_loader.dart';

class SignUpScreenByPhone extends StatefulWidget {
  const SignUpScreenByPhone({super.key});

  @override
  State<SignUpScreenByPhone> createState() => _SignUpScreenByPhoneState();
}

bool selected = true;
String completePhoneNumber = '';

class _SignUpScreenByPhoneState extends State<SignUpScreenByPhone> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          var phone = context.watch<SignUpProvider>();
          return Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
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
                    completePhoneNumber: completePhoneNumber,
                  ),
                  SizedBox(
                    height: (size.height < 300)
                        ? size.height * .05
                        : size.height * .20,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (numberController.text.isEmpty) {
                        showSnack(
                            context: context, text: "Please Enter Phone Field");
                      } else {
                        FocusScope.of(context).unfocus();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Wait for Verification OTP"),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Never tab Back"),
                              ],
                            ),
                            actions: <Widget>[
                              CustomLoader(),
                            ],
                          ),
                        );
                        var data = context.read<SignUpProvider>();

                        await data.PhoneVerifyFireBase(
                            context, PhoneProvider.phonenumber);
                        data.isLoading
                            ? null
                            : push(
                                context,
                                OTPScreen(
                                  phone: PhoneProvider.phonenumber,
                                ));
                        // numberController =
                        //     await CustomCountryPhoneField().controller;
                      }
                    },
                    text: "Next",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    colorBox: AppColors.grey,
                    onTap: () async {
                      push(context, RootScreen());
                    },
                    text: "Skip",
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
