import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otp_1 = TextEditingController();
  TextEditingController otp_2 = TextEditingController();
  TextEditingController otp_3 = TextEditingController();
  TextEditingController otp_4 = TextEditingController();
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
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppColors.black,
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
                          text: " +923233342939. ",
                          style: AppTextStyles.textStyleNormalBoldBodySmall,
                        ),
                      ]))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 4; i++)
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomTextFormField(
                        controller: i == 1
                            ? otp_1
                            : i == 2
                                ? otp_2
                                : i == 3
                                    ? otp_3
                                    : otp_4,
                        keyboard_type: TextInputType.number,
                        maxlength: 1,
                        alignment: TextAlign.center,
                        border: InputBorder.none,
                        hint_text: i == 1 ? " " : "-",
                      ),
                    ),
                  //–
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // CustomText(
              //   text: "RESEND CODE BY CALL IN 56",
              //   fontsize: 16,
              //   fontweight: FontWeight.bold,
              //   decorationtext: TextDecoration.underline,
              //   color: AppColors.black,
              //   overflow: TextOverflow.ellipsis,
              // ),
              const SizedBox(
                height: 10,
              ),
              // CustomText(
              //   text: "RESEND CODE BY SMS IN 56",
              //   fontsize: 16,
              //   fontweight: FontWeight.bold,
              //   decorationtext: TextDecoration.underline,
              //   color: AppColors.black,
              //   overflow: TextOverflow.ellipsis,
              // ),
              const SizedBox(
                height: 20,
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
              const Spacer(),
              InkWell(
                onTap: () {
                  // fuctionality
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.blue),
                    child: Center(
                      child: Text(
                        "Next",
                        style:
                            AppTextStyles.textStyleNormalBodySmall_WhiteColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
