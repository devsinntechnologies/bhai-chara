import 'package:bhai_chara/common/utils/app_colors.dart';
import 'package:bhai_chara/common/utils/Navigations.dart';
import 'package:bhai_chara/view/authentication/create_password.dart';
import 'package:flutter/material.dart';
import 'package:bhai_chara/common/custom_button.dart';
import '../../common/custom_container_tile.dart';
import '../../common/utils/text-styles.dart';
import 'package:bhai_chara/common/utils/showSnack.dart';

class SignupByEmail extends StatefulWidget {
  const SignupByEmail({super.key});

  @override
  State<SignupByEmail> createState() => _SignupByEmailState();
}

class _SignupByEmailState extends State<SignupByEmail> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Container(
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
                      // color: AppColors.White,
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
              "Enter your email",
              style: AppTextStyles.textStyleBoldSubTitleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              "We will send a confirmation code to your email",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleNormalBodyXSmall,
            )),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                height: 60.0,
                obsecuretext: false,
                width: size.width,
                controller: emailController,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.grey)),
                hintText: "Email"),
            const Spacer(),
            CustomButton(
              onTap: () {
                if (emailController.text.isEmpty) {
                  showSnack(context, "enter email");
                } else if (emailController.text.contains("@gmail.com") ==
                    false) {
                  showSnack(context, "Enter correct email");
                } else {
                  push(context, CreatePassword(email: emailController.text));
                 // showSnack( context,"Enter email");
                }
                //  else if (emailController.text.contains("@gmail.com") == false) {
                //   showSnack( context,  "Enter correct email");
                // } 
                // else {
                //   push(context,  CreatePassword(email: emailController.text));
                // }
              },
              text: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
