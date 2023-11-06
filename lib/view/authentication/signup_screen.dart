import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_email.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_phone.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../../controller/provider/firebase/firebaseauthentication.dart';
import '../../view/home-screens/root_screen.dart';
import 'package:provider/provider.dart';


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
        // backgroundColor: AppColors.primary,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding:const  EdgeInsets.all(10),
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
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.contain)),
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
                      width: size.width * .90,
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
               Builder(
                builder: (context){
                  var blox = context.watch<FireAuthProvider>();
                  return blox.isLoading ? const  CircularProgressIndicator():
              CustomContainerTile(
                image: "assets/images/google.png",
                text: "Continue with Google",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
               ontap: (){
               
                //  var provider=    context.read<FireAuthProvider>();
                  var data= blox.SignUpByGoogle(context);
                print(data);
                 // push(context,RootScreen());
                },
              );}),
             
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                  ontap: () {
                    push(context,const  SignupByEmail());
                  },
                  image: "assets/images/mail.png",
                  text: "Continue with Email",
                  style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
                  ),
              
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you continue, you are accepting",
                    style: AppTextStyles.textStyleNormalXLBodySmall,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
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
