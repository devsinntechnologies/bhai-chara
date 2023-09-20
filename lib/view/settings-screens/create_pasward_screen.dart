import 'package:bhai_chara/view/authentication/otp_code_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../common/custom_button.dart';
import '../../provider/visibility_provider.dart';
import '../../utils/container.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/push.dart';

// ignore: must_be_immutable
class CreatePasswardScreen extends StatelessWidget {
  CreatePasswardScreen({Key? key});
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final visibilityProvider passwordVisibilityProvider = visibilityProvider();
  final visibilityProvider confirmPasswordVisibilityProvider =
      visibilityProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainer(
            text: 'User Preferences',
            iconVar: Icons.arrow_back_ios,
          ),
          ChangeNotifierProvider(
            create: (_) => visibilityProvider(),
            child: CustomeTextField(
              hinttext: 'Password',
              controller: passwordController,
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => visibilityProvider(),
            child: CustomeTextField(
              hinttext: 'Confirm Password',
              controller: confirmPasswordController,
            ),
          ),
           Container(
             margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
             child: CustomButton((){
                        push(context, OTPScreen());
                      }, 'Next' ),
           ),
        ],
      ),
    );
  }
}
