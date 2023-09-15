import 'package:bhai_chara/provider/authentication_provider/auth_provider.dart';
import 'package:flutter/material.dart';

import '../../common/custom_container_tile.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  var x = 1;
  var y = 1;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
              "Create a password",
              style: AppTextStyles.textStyleBoldSubTitleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: Text.rich(
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                        text: "You are creating a password for",
                        style: AppTextStyles.textStyleNormalBodyXSmall,
                      ),
                      TextSpan(
                        text: " +923233342939. ",
                        style: AppTextStyles.textStyleBoldBodyXSmall,
                      ),
                      TextSpan(
                        text: "This will help you login faster next time.",
                        style: AppTextStyles.textStyleNormalBodyXSmall,
                      )
                    ]))),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextField(
                        obsecuretext: x % 2 == 0 ? false : true,
                        height: 30,
                        width: size.width * .80,
                        controller: passwordController,
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: x % 2 != 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    x = x + 1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                ))
                            : IconButton(
                                onPressed: AuthProvider.IncrementVariable(x),
                                icon: const Icon(
                                  Icons.visibility,
                                  size: 20,
                                )),
                        suffixIconColor: AppColors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.grey,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextField(
                        obsecuretext: y % 2 == 0 ? false : true,
                        height: 30,
                        width: size.width * .80,
                        controller: confirmpasswordController,
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        suffixIcon: y % 2 != 0
                            ? IconButton(
                                onPressed: AuthProvider.IncrementVariable(y),
                                icon: const Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                ))
                            : IconButton(
                                onPressed: AuthProvider.IncrementVariable(y),
                                icon: const Icon(
                                  Icons.visibility,
                                  size: 20,
                                )),
                        suffixIconColor: AppColors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                //fuctionality
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.blue),
                  child: Center(
                    child: Text(
                      "Next",
                      style: AppTextStyles.textStyleBoldLargeBody,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}