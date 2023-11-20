import 'dart:io';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../common/custom_button.dart';
import 'authentication/location.dart';

// ignore: must_be_immutable
class TestScreen extends StatefulWidget {
  TestScreen({
    super.key,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  var focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  ).copyDecorationWith(
    borderRadius: BorderRadius.circular(8),
  );

  var submittedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.black),
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  // defaultPinTheme.copyWith(
  //   decoration: defaultPinTheme.decoration?.copyWith(
  //     color: Color.fromRGBO(234, 239, 243, 1),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            pop(
                              context,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Login",
                          style: AppTextStyles.textStyleNormalBodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 130,
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
                    height: 20,
                  ),
                  Text(
                    "Enter Your Confirmation Code",
                    style: AppTextStyles.textStyleBoldBodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: size.width * .80,
                      child: Text.rich(
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          TextSpan(children: [
                            TextSpan(
                              text: "Enter the 4-digit code sent via SMS to",
                              style: AppTextStyles.textStyleNormalBodySmall,
                            ),
                            TextSpan(
                              text: "Phone Number",
                              style: AppTextStyles.textStyleNormalBoldBodySmall,
                            ),
                          ]))),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {
                          return s == '2222' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 10),
                      //   width: 60,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: AppColors.grey),
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: CustomTextFormField(
                      //     controller: i == 1
                      //         ? otp_1
                      //         : i == 2
                      //             ? otp_2
                      //             : i == 3
                      //                 ? otp_3
                      //                 : otp_4,
                      //     keyboard_type: TextInputType.number,
                      //     maxlength: 1,
                      //     alignment: TextAlign.center,
                      //     border: InputBorder.none,
                      //     hint_text: i == 1 ? " " : "-",
                      //     onsubmit: i == 3
                      //         ? (code) {
                      //             otp = code;
                      //             var pro =
                      //                 context.read<SignUpProvider>();
                      //             pro.OTPVerify(context, otp);
                      //           }
                      //         : null,
                      //   ),
                      // ),
                      //–
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "RESEND CODE BY SMS IN 1 min",
                    style: AppTextStyles.textStyleSubtitleUnderlineBody,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text:
                                "If you have not received the code through call, please request ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.5,
                              fontStyle: FontStyle.normal,
                              color: Color(0xfa808080),
                            )),
                        TextSpan(
                            text: "‘Resend Code by SMS’.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              fontStyle: FontStyle.normal,
                              color: Color(0xfa1A1A1A),
                            ))
                      ])),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                // if (otp_1.text.isEmpty) {
                //   showSnack(context: context, text: "Enter OTP Please");
                // } else if (otp_2.text.isEmpty) {
                //   showSnack(context: context, text: "Enter OTP Please");
                // } else if (otp_3.text.isEmpty) {
                //   showSnack(context: context, text: "Enter OTP Please");
                // } else if (otp_4.text.isEmpty) {
                //   showSnack(context: context, text: "Enter OTP Please");
                // } else {
                FocusScope.of(context).unfocus();
                push(context, const LocationScreen());
                // }
              },
              text: "Next",
            ),
          ],
        ),
      ),
    ));
  }
}

func() {}
