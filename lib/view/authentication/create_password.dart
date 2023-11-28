import 'package:flutter/material.dart';
import '../../common/custom_container_tile.dart';
import '../../controller/provider/authentication_provider/variable.dart';
import '../../controller/services/ontap_passwordScreen.dart';
import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';
import '../../common/custom_button.dart';
import 'package:provider/provider.dart';
import '../../controller/services/auth_service.dart';
import '../../utils/showSnack.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/authentication/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';



// ignore: must_be_immutable
class CreatePassword extends StatefulWidget {
  CreatePassword({super.key, this.emailController, this.fullName});
  var emailController, fullName;
  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  var x = 1;
  var y = 1;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();  
  static FirebaseFirestore firestore= FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Container(
              height: size.height * .95,
              width: size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/logo.png"),
                                      fit: BoxFit.contain)),
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
                                    text: "You are creating a password for ",
                                    style:
                                        AppTextStyles.textStyleNormalBodyXSmall,
                                  ),
                                  TextSpan(
                                    text: widget.emailController,
                                    style:
                                        AppTextStyles.textStyleBoldBodyXSmall,
                                  ),
                                  TextSpan(
                                    text:
                                        " This will help you login faster next time.",
                                    style:
                                        AppTextStyles.textStyleNormalBodyXSmall,
                                  )
                                ]))),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  obsecuretext: x % 2 == 0 ? false : true,
                                  // height: 30,
                                  width: size.width * .90,
                                  controller: passwordController,
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labeltext: "Password",
                                  suffixIcon: x % 2 != 0
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {});

                                            x = VariableProvider
                                                .IncrementVariable(x);
                                          },
                                          icon: const Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            x = VariableProvider
                                                .IncrementVariable(x);
                                          },
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
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  obsecuretext: y % 2 == 0 ? false : true,
                                  width: size.width * .90,
                                  controller: confirmpasswordController,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: AppColors.grey)),
                                  // hintText: "Confirm Password",
                                  labeltext: "Confirm Password",
                                  suffixIcon: y % 2 != 0
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            y = VariableProvider
                                                .IncrementVariable(y);
                                          },
                                          icon: const Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            y = VariableProvider
                                                .IncrementVariable(y);
                                          },
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
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButton(onTap: ()async{
                    if (passwordController.text.isEmpty) {
                    showSnack(context: context, text: "Please Enter Password");
                  } else if (passwordController.text.length < 7) {
                    showSnack(context:context, text: "Invalid Password");
                  }else if (passwordController.text != confirmpasswordController.text) {
                    showSnack(context:context, text: "Invalid Password");
                  }else{
                    try{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
             var  userCredential=   await   firebaseAuth
          .createUserWithEmailAndPassword(email:widget.emailController, password: passwordController.text);

 firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email':widget.emailController,
            'name': widget.fullName,
          },SetOptions(merge: true)
          );
  push(context,RootScreen());

                    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); 
                    }
                  }},text: "Next",),
                  // ontapPasswordScreen(
                  //     context: context,
                  //     confirmpasswordController: confirmpasswordController,
                  //     passwordController: passwordController,
                  //     email: widget.emailController),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
