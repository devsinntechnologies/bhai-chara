import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomContainer extends StatelessWidget {
  final text,secondText, imgLink;
   CustomContainer({required this.text, required this.imgLink, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(left: 20),
            height: 110,
            // width: 185,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(children: [
              Image(image: AssetImage(imgLink), height: 70,),
              CustomText(txt: text, fontsize: 16, fontweight: FontWeight.w700,),
              CustomText(txt: secondText, fontsize: 14, fontweight: FontWeight.w400,),
            ]),

          );
  }
}