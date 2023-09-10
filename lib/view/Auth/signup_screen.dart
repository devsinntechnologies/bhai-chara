import 'package:bhai_chara/main.dart';
import 'package:bhai_chara/utils/CustomIcon/my_flutter_app_icons.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            children: [
              SizedBox(
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
                        image: DecorationImage(
                            scale: 1,
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: size.width * .85,
                      child: Text(
                        "Where trust unites buyers and seller in a strong community",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyleNormalBodyMedium,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 100, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage("assets/images/google.png"),
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            "Continue with Google",
                            style: AppTextStyles.textStyleBoldBodySmall,
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 100, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              // padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.facebook,
                                color: AppColors.blue,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            "Continue with Facebook",
                            style: AppTextStyles.textStyleBoldBodySmall,
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 100, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                              // padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.mail,
                                color: AppColors.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            "Continue with Email",
                            style: AppTextStyles.textStyleBoldBodySmall,
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
