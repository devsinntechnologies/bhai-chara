import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

Widget CustomContainer(context,text){
return Container(
          height: 80,
          width: double.infinity,
          color: AppColors.black,
          child: Row(children: [
            IconButton(onPressed: (){
            Navigator.pop(context);
            },icon: Icon(Icons.close),color: AppColors.white,),
            SizedBox(width: 10,),
            Text(text,style: AppTextStyles.textStyleNormalBodyMedium.copyWith(color: AppColors.white),)
          ],),
        );
}