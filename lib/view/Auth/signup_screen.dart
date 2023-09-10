import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/custom_container_tile.dart';
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
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                image: "assets/images/google.png",
                text: "Continue with Google",
              ),
              SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                image: "assets/images/facebook.png",
                text: "Continue with Facebook",
              ),
              SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                image: "assets/images/mail.png",
                text: "Continue with Email",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                image: "assets/images/phone.png",
                text: "Continue with Phone",
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you continue, you are accepting",
                    style: AppTextStyles.textStyleBoldBodyXSmall,
                  ),
                ],
              ),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Bhai Chara ",
                        style: AppTextStyles.textStyleBoldBodyXSmall,
                      ),
                      TextSpan(
                        text: "Terms and Conditions ",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                      ),
                      TextSpan(
                        text: "and ",
                        style: AppTextStyles.textStyleBoldBodyXSmall,
                      ),
                      TextSpan(
                        text: "Privacy",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                        // Apply ellipsis to this TextSpan
                      ),
                      const TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "Policy",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
