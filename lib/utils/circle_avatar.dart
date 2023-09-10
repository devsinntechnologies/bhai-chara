import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomCircleAvatar extends StatelessWidget {
  final link, col, txt;
   CustomCircleAvatar({required this.link, required this.col, required this.txt});

  @override
  Widget build(BuildContext context) {
    return
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: col,
                  child: Image(
                        image: AssetImage(link),
                        height: 32,
                        width: 32,
                      ),
                  radius: 30,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(txt,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),
                ),
              ],
            ),
          );
  }
}