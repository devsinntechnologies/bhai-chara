import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import 'package:bhai_chara/utils/text-styles.dart';

import '../../../../utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color color;
  final Color fontcolor;
  var leftpadding;
  var  text;
  var rightpadding;
   ChatBubble({super.key,
   required this.message,
   required this.color,
  //  required this.alignment,
   required this.text,
   required this.fontcolor,
  required this.leftpadding,
  required this.rightpadding,
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
        child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message,style: TextStyle(fontSize: 16,color: fontcolor)),
                  SizedBox(height: 7),
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    // Spacer(),
                     Text(
                        text,
                         style: AppTextStyles.textStyleNormalBodyXSmall.copyWith(
                             color: fontcolor,
                             fontSize: 10)),
                   ],
                 ),
              ],
            ),
           
      ),
    );
  }
}