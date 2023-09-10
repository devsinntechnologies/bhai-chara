import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomCircleAvatarRow extends StatelessWidget {
  final link, col, txt, ontap;
   CustomCircleAvatarRow({required this.link, required this.col, required this.txt, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return
          InkWell(
            onTap: ontap,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
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
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(txt,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),
                  ),
                  Spacer(),
                 IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, size: 24,))
                ],
              ),
            ),
          );
  }
}