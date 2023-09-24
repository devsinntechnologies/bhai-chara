
import 'package:flutter/material.dart';

Widget   CustomButtonSmall(
    {var text, var height, var fontcolor, var color, var onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      margin:const  EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 25
          
        ),
        color: color,
      ),
      height: height,
      width: 80,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15, color: fontcolor),
          )),
    ),
  );
}
