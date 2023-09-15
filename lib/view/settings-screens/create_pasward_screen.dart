import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/container.dart';
import '../../utils/custom_button_create_password.dart';
import '../../utils/custom_textfield.dart';

class CreatePasswardScreen extends StatelessWidget {
   CreatePasswardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainer(
            text: 'User Preferences',
            iconVar: Icons.arrow_back_ios,
          ),
          CustomeTextField(
            hinttext: 'Passward',
          ),
          CustomeTextField(
            hinttext: 'confirm Passward',
          ),
          CustomButtonCreatePassword(),
        ],
      ),
    );
  }
}