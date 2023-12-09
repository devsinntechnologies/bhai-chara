import 'package:bhai_chara/common/custom_pinput.dart';
import 'package:bhai_chara/controller/provider/authentication_provider/firebase_signup_provider.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/buttons/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  var phone;
  OTPScreen({this.phone = ""});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otp;
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
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
                              width: 10,
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
                                  text:
                                      "Enter the 4-digit code sent via SMS to",
                                  style: AppTextStyles.textStyleNormalBodySmall,
                                ),
                                TextSpan(
                                  text: widget.phone,
                                  style: AppTextStyles
                                      .textStyleNormalBoldBodySmall,
                                ),
                              ]))),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomPinPut(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     for (int i = 1; i <= 4; i++)
                      //       Container(
                      //         margin: EdgeInsets.only(right: 10),
                      //         width: 60,
                      //         height: 60,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: AppColors.grey),
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         child: CustomTextFormField(
                      //           controller: i == 1
                      //               ? otp_1
                      //               : i == 2
                      //                   ? otp_2
                      //                   : i == 3
                      //                       ? otp_3
                      //                       : otp_4,
                      //           keyboard_type: TextInputType.number,
                      //           maxlength: 1,
                      //           alignment: TextAlign.center,
                      //           border: InputBorder.none,
                      //           hint_text: i == 1 ? " " : "-",
                      //           onsubmit: i == 3
                      //               ? (code) {
                      //                   otp = code;
                      //                   var pro =
                      //                       context.read<SignUpProvider>();
                      //                   pro.OTPVerify(context, otp);
                      //                 }
                      //               : null,
                      //         ),
                      //       ),
                      //     //–
                      //   ],
                      // ),
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
                  onTap: () async {
                    // if (otp_1.text.isEmpty) {
                    //   showSnack(context: context, text: "Enter OTP Please");
                    // } else if (otp_2.text.isEmpty) {
                    //   showSnack(context: context, text: "Enter OTP Please");
                    // } else if (otp_3.text.isEmpty) {
                    //   showSnack(context: context, text: "Enter OTP Please");
                    // } else if (otp_4.text.isEmpty) {
                    //   showSnack(context: context, text: "Enter OTP Please");
                    // } else {
                    try {
                      FocusScope.of(context).unfocus();
                      var pro = context.read<SignUpProvider>();

                      await pro.OTPVerify(context, pro.OTPCode);

                      // showSnack(context: context, text: "Successfull");
                      // push(context, LocationScreen());
                    } catch (e) {
                      showSnack(
                          context: context, text: "Something Went Wrong!");
                    }

                    // }
                  },
                  text: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
