import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomText extends StatelessWidget {
final txt, fontsize, fontweight ;
   CustomText({this.txt, this.fontsize, this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(txt, style: TextStyle(fontSize: fontsize, fontWeight:fontweight),);
  }
}