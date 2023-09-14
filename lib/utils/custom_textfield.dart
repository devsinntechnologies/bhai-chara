import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'app_colors.dart';

class CustomeTextField extends StatelessWidget {
  final hinttext;
   CustomeTextField({required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 20),
            height: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.Grey)),
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 24),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: hinttext,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility),
                      )),
                ),
              ),
            ),
          )
;
  }
}