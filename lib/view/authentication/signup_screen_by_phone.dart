import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
<<<<<<< Updated upstream
import 'package:bhai_chara/view/settings-screens/create_pasward_screen.dart';
import 'package:flutter/material.dart';

import '../../common/custom_button.dart';
import '../../utils/push.dart';
=======
import 'package:bhai_chara/view/authentication/otp_code_screen.dart';
import 'package:flutter/material.dart';

import '../../common/custom_button.dart';
>>>>>>> Stashed changes

class SignUpSCreenByPhone extends StatefulWidget {
  const SignUpSCreenByPhone({super.key});

  @override
  State<SignUpSCreenByPhone> createState() => _SignUpSCreenByPhoneState();
}

class _SignUpSCreenByPhoneState extends State<SignUpSCreenByPhone> {
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                "Enter your phone",
                style: AppTextStyles.textStyleBoldSubTitleLarge,
              ),
              SizedBox(
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
                // height: 60,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/images/pakistan.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // CustomText(
                    //   text: "+92",
                    //   fontsize: 16,
                    //   fontweight: FontWeight.w400,
                    //   color: AppColors.grey,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppColors.light_black,
                    ),
                    CustomTextField(
                      width: size.width * .60,
                      controller: numberController,
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      obsecuretext: false,
                    )
                  ],
                ),
              ),
              const Spacer(),
<<<<<<< Updated upstream
              InkWell(
                onTap: () {
                  //fuctionality
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.blue),
                    child: CustomButton((){
                      push(context, CreatePasswardScreen());
                    }, 'Next' ),),
              ),
=======
              CustomButton((){
                push(context, OTPScreen())
              },"Next")
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
              //           style:
              //               AppTextStyles.textStyleNormalBodySmall_WhiteColor,
              //         ),
              //       )),
              // ),
>>>>>>> Stashed changes
            ],
          ),
        ),
      ),
    );
  }
}
