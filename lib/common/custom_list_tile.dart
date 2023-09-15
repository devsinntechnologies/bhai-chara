import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile(
      {super.key,
      this.circular_radius,
      this.back_color,
      this.back_image,
      this.circularwidget,
      this.titletext,
      this.endwidget,
      this.subtitleText,
      this.subtitleStyle,
      this.titleStyle});
  var circular_radius,
      back_image,
      circularwidget,
      back_color,
      titletext,
      subtitleText,
      endwidget,
      titleStyle,
      subtitleStyle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: CircleAvatar(
          backgroundColor: back_color,
          radius: circular_radius,
          child: circularwidget),
      title: Text(titletext),
      horizontalTitleGap: null,
      titleTextStyle: titleStyle,
      subtitleTextStyle: subtitleStyle,
      subtitle: Text(subtitleText),
      trailing: endwidget,
    );
  }
}
