import 'package:bhai_chara/common/custom_appbaar.dart';
import 'package:flutter/material.dart';

import '../utils/text-styles.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left:12.0,right: 12,bottom:12),
          child: Column(
              children: [
          CustomContainer(context, "Review your details"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:12.0),
            child: Row(
              
              children: [
                const CircleAvatar(
                  radius: 40,
                ),
               const SizedBox(width:30)
        ,               Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your name",
                    style: AppTextStyles.textStyleNormalBodyXSmall,
                  ),
                 const SizedBox(height: 5,),
                 const Container(
                    width: MediaQuery.of(context).size.width-200,
                    height: 50,
                    child: TextFormField(
                        decoration: InputDecoration(
                          
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      hintText: "Type here",
                      hintStyle:
                         const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                  ),
                ],
              )
                
                
              ],
            ),
          ),
         Row(
            children:[
              Text("Verified phone number"),
              Spacer(),
              Icon(Icons.done_outlined),
              Text("0311-6743657"),
            ]
          )
              ],
            ),
        ));
  }
}
