import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomText extends StatelessWidget {
final txt, fontsize, fontweight, col ;
   CustomText({required this.txt, this.fontsize, this.fontweight, this.col});

  @override
  Widget build(BuildContext context) {
    return Text(txt, style: TextStyle(fontSize: fontsize, fontWeight:fontweight, color: col),);
  }
}