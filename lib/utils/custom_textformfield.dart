import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomTextFormField extends StatefulWidget {
   CustomTextFormField({super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.Grey, width: 1),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                        child: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      hintText: "What are you looking for?",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              );
  }
}