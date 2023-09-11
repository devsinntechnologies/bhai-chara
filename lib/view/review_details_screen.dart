import 'package:flutter/material.dart';

import '../common/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class ReviewDetailsScreen extends StatefulWidget {
   ReviewDetailsScreen({super.key});

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
var light= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.black,
title:const Text( "Review your details"),
leading: IconButton(onPressed: (){
            Navigator.pop(context);
            },icon: const Icon(Icons.close),color: AppColors.white,),
      ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              children: [
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
                  Container(
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
              Text("Verified phone number",style: AppTextStyles.textStyleBoldBodyXSmall),
              Spacer(),
              Icon(Icons.done_outlined),
              SizedBox(width: 8,),
              Text("0311-6743657",style: AppTextStyles.textStyleBoldBodyXSmall),
            ]
          ),
          Row(
            children:[
             Text("Show my phone number on ads",style: AppTextStyles.textStyleBoldBodyXSmall),
               Spacer(),
          Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: AppColors.blue,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    )
            ]
          ),
          Spacer(),
            CustomButton((){},"Post Now")
              
              
              ],
            ),
        ));
  }
}
