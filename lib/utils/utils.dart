import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(context, text)
{
  var snackBar = SnackBar(content: Text(text));
   ScaffoldMessenger.of(context).showSnackBar((snackBar));
}


   push(context, screen ){
   Navigator.push(context, CupertinoPageRoute(builder: (_)=> screen));
   }

   pop(context){
    Navigator.pop(context, );
   }

   pushUntil(context, screen ){
   Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> screen), (route)=> false);
   }