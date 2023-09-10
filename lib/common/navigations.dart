



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Navigation{
static pushUntil(context, screen){
  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> screen ), (route) => false);
}

static push(context,screen){
  Navigator.push(context, MaterialPageRoute(builder: (_)=> screen));
}

}