import 'dart:developer';

import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/settings-screens/create_pasward_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_appbaar.dart';
import '../../provider/switch_provider.dart';
import '../../utils/text-styles.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomContainer(context, "Privacy"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text("Show my phone number on ads",
                style: AppTextStyles.textStyleBoldBodySmall),
          const  Spacer(),
            Consumer<SwitchProvider>(
              builder: (context, pro, _) {
                return Switch(
                  value: pro.allow,
                  onChanged: (newValue) {
                    pro.change(); // Call the toggle method when the switch is changed
                  },
                );
              },
            ),
          ]),
        ),
      const  Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
             // debugger();
              push(context, CreatePasswardScreen());
            },
            child: Row(
              children: [
                Text("Create Password",
                    style: AppTextStyles.textStyleBoldBodySmall),
              const   Spacer(),
               
               const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      const Divider(),
      
      ]),
    );
  }
}
