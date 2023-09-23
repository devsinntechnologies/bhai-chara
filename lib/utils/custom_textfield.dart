import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

// ignore: must_be_immutable
class CustomeTextField extends StatelessWidget {
  final hinttext;
  TextEditingController controller;

  CustomeTextField({
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<visibilityProvider1>();
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.Grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: TextFormField(
            controller: controller,
            obscureText: !pro.show,
            decoration: InputDecoration(
                hintText: hinttext,
                border: InputBorder.none,
                suffixIcon:
                    Consumer<visibilityProvider1>(builder: (context, pro, _) {
                  return IconButton(
                      onPressed: () {
                        pro.toggle();
                      },
                      icon: pro.show == true
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off));
                })),
          ),
        ),
      ),
    );
  }
}
