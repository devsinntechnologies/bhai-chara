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
                padding: EdgeInsets.only(top: 20),
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
                      style: AppTextStyles.textStyleNormalBoldBodySmall,
                    ),
                  ],
                ),
              ),
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
                "Enter Your Confirmation Code",
                style: AppTextStyles.textStyleBoldSubTitleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: size.width * .60,
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
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: CustomTextField(
                      height: 50,
                      width: 50,
                      controller: otp_1,
                      border: InputBorder.none,
                      hintText: "-",
                      obsecuretext: false),
                ),
              ),
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: AppColors.grey),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   padding: EdgeInsets.all(10),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           CustomTextField(
              //             obsecuretext: x % 2 == 0 ? false : true,
              //             height: 30,
              //             width: size.width * .80,
              //             controller: passwordController,
              //             border: InputBorder.none,
              //             hintText: "Password",
              //             suffixIcon: x % 2 != 0
              //                 ? IconButton(
              //                     onPressed: () {
              //                       setState(() {
              //                         x = x + 1;
              //                       });
              //                     },
              //                     icon: const Icon(
              //                       Icons.visibility_off,
              //                       size: 20,
              //                     ))
              //                 : IconButton(
              //                     onPressed: () {
              //                       setState(() {
              //                         x = x + 1;
              //                       });
              //                     },
              //                     icon: const Icon(
              //                       Icons.visibility,
              //                       size: 20,
              //                     )),
              //             suffixIconColor: AppColors.grey,
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //         color: AppColors.grey,
              //         style: BorderStyle.solid,
              //         strokeAlign: BorderSide.strokeAlignInside),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   padding: EdgeInsets.all(10),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           CustomTextField(
              //             obsecuretext: y % 2 == 0 ? false : true,
              //             height: 30,
              //             width: size.width * .80,
              //             controller: confirmpasswordController,
              //             border: InputBorder.none,
              //             hintText: "Confirm Password",
              //             suffixIcon: y % 2 != 0
              //                 ? IconButton(
              //                     onPressed: () {
              //                       setState(() {
              //                         y = y + 1;
              //                       });
              //                     },
              //                     icon: const Icon(
              //                       Icons.visibility_off,
              //                       size: 20,
              //                     ))
              //                 : IconButton(
              //                     onPressed: () {
              //                       setState(() {
              //                         y = y + 1;
              //                       });
              //                     },
              //                     icon: const Icon(
              //                       Icons.visibility,
              //                       size: 20,
              //                     )),
              //             suffixIconColor: AppColors.grey,
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

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
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
