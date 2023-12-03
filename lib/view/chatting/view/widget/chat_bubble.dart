import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import 'package:bhai_chara/utils/text-styles.dart';

import '../../../../utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color color;
  final Color fontcolor;
  final Color timecolor;
  var leftpadding;
  var rightpadding;
  var time;
  var crossAxisAlignment;
   ChatBubble({super.key,
   required this.message,
   required this.color,
   required this.fontcolor,
  required this.leftpadding,
  required this.rightpadding,
  required this.time,
  required this.timecolor,
  required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:leftpadding,right: rightpadding),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
      
          
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(message,style: TextStyle(fontSize: 16,color: fontcolor)),
            SizedBox(width: 12,),
            Align(
            alignment:  Alignment.bottomRight,
              child: Text(time,style:AppTextStyles.textStyleNormalBodyXSmall.copyWith(color:timecolor,fontSize: 8))),
          ],
        ),
      ),
    );
  }
}