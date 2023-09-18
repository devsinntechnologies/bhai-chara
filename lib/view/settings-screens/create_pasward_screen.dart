import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/visibility_provider.dart';
import '../../utils/container.dart';
import '../../utils/custom_button_create_password.dart';
import '../../utils/custom_textfield.dart';

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
          CustomButtonCreatePassword(
            text: "Create Password",
          ),
        ],
      ),
    );
  }
}
