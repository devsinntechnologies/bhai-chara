// ignore_for_file: must_be_immutable

import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/home-screens/sell_sub_categorie_screen.dart';
import 'package:flutter/cupertino.dart';

class Alert extends StatefulWidget {
  String? maintext;
  String? text1;
  String? textbutton1;
  Color? buttoncolor;
  Color? buttoncolor2;
  final VoidCallback? onPressed;
  Alert(
      {super.key,
      this.buttoncolor,
      this.buttoncolor2,
      this.maintext,
      this.onPressed,
      this.text1,
      this.textbutton1});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/images/fluent_animal-cat-28-filled.png"),
                fit: BoxFit.contain)),
      ),
      content: Text(widget.text1!),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            child: Text(
              widget.textbutton1!,
              style: TextStyle(color: widget.buttoncolor!),
            ),
            onPressed: () async {}),
        CupertinoDialogAction(
          child: Text(
            "Cancel",
            style: TextStyle(color: widget.buttoncolor2!),
          ),
          onPressed: () {
            pushUntil(context, SubCategorieScreen());
          },
        ),
      ],
    );
  }
}
