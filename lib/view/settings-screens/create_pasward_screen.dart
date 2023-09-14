import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/container.dart';
import '../../utils/custom_textfield.dart';

class CreatePasswardScreen extends StatefulWidget {
  const CreatePasswardScreen({super.key});

  @override
  State<CreatePasswardScreen> createState() => _CreatePasswardScreenState();
}

class _CreatePasswardScreenState extends State<CreatePasswardScreen> {
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
        ],
      ),
    );
  }
}
