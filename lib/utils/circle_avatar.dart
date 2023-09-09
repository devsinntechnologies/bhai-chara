import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomCircleAvatar extends StatelessWidget {
  final link, col;
   CustomCircleAvatar({required this.link, required this.col});

  @override
  Widget build(BuildContext context) {
    return
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundColor: col,
              child: Image(
                    image: AssetImage(link),
                    height: 32,
                    width: 32,
                  ),
              radius: 50,
            ),
          );
  }
}