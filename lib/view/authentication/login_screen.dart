import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/controller/provider/authentication_provider/login_provider.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/container.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/authentication_provider/auth_provider.dart';
import '../../controller/provider/authentication_provider/variable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var x = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                text: "Login",
                iconVar: null,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 130,
                width: 150,
                decoration: const BoxDecoration(
                    // color: AppColors.primary,
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome back",
                style: AppTextStyles.textStyleBoldSubTitleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                obsecuretext: false,
                width: size.width * .90,
                controller: emailController,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                labeltext: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                obsecuretext: x % 2 == 0 ? false : true,
                // height: 30,
                width: size.width * .90,
                controller: passwordController,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                labeltext: "Password",
                suffixIcon: x % 2 != 0
                    ? IconButton(
                        onPressed: () {
                          setState(() {});

                          x = VariableProvider.IncrementVariable(x);
                        },
                        icon: const Icon(
                          Icons.visibility_off,
                          size: 20,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {});
                          x = VariableProvider.IncrementVariable(x);
                        },
                        icon: const Icon(
                          Icons.visibility,
                          size: 20,
                        )),
                suffixIconColor: AppColors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                onTap: () async {
                  if (emailController.text.isEmpty) {
                    showSnack(context: context, text: "Please Enter Email");
                  } else if (passwordController.text.isEmpty) {
                    showSnack(context: context, text: "Please Enter Password");
                  } else if (passwordController.text.length <= 5) {
                    showSnack(context: context, text: "Invalid Password");
                  } else {
                    String currentAddress = "";
                    // ignore: unused_field
                    Position? _currentPosition;
                    var pro = context.read<AuthProvider>();
                    pro.Location(context, _currentPosition, currentAddress);
                    var login = context.read<LoginProvider>();
                    login.Login(context, emailController, passwordController);

                    FocusScope.of(context).nextFocus();
                  }
                },
                text: "Continue",
                width: size.width * .90,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.textStyleSubtitleBody,
                  ),
                  TextButton(
                    onPressed: () {
                      push(context, SignUpScreen());
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyles.textStyleSubtitleBody
                          .copyWith(color: AppColors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 3, left: 3),
                    height: 2,
                    width: size.width * .30,
                    color: AppColors.light_black,
                  ),
                  Text(
                    "OR",
                    style: AppTextStyles.textStyleSubtitleBody,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    height: 2,
                    width: size.width * .30,
                    color: AppColors.light_black,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomContainerTile(
                width: size.width * .80,
                image: "assets/images/google.png",
                text: "Continue with Google",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
                ontap: () {},
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // CustomContainerTile(
              //     ontap: () {
              //       push(context, SignupByEmail());
              //     },
              //     width: size.width * .80,
              //     image: "assets/images/mail.png",
              //     text: "Continue with Email",
              //     style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              //     tap: () {
              //       push(context, SignupByEmail());
              //     }),
              // const SizedBox(
              //   height: 20,
              // ),
              // CustomContainerTile(
              //     ontap: () {
              //       push(context, SignUpScreenByPhone());
              //     },
              //     width: size.width * .80,
              //     image: "assets/images/phone.png",
              //     text: "Continue with Phone",
              //     style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              //     tap: () {
              //       push(context, SignUpScreenByPhone());
              //     }),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}
