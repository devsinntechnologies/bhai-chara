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
            Container(
              height: 50,
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
                      Container(
                          width: size.width * .80,
                          child: CustomTextFormField(
                            maxlength: 8,
                            controller: passwordController,
                            hint_text: "Password",
                            border: InputBorder.none,
                          )),
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
                      style: AppTextStyles.textStyleNormalBodySmall_WhiteColor,
                    ),
                  )),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
