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
      this.end_icon_widget,
      this.subtitleText,
      this.subtitleStyle,
      this.titleStyle});
  var circular_radius,
      back_image,
      circularwidget,
      back_color,
      titletext,
      subtitleText,
      end_icon_widget,
      titleStyle,
      subtitleStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: back_color,
              radius: circular_radius,
              child: circularwidget),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Text(
                        titletext,
                        style: titleStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    subtitleText,
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CutomListTileUser extends StatelessWidget {
  CutomListTileUser(
      {super.key,
      this.leading_widget,
      this.subtitle_text,
      this.title_text,
      this.trailing_widget,
      this.subtitle_style,
      this.title_style});
  var leading_widget,
      title_text,
      subtitle_text,
      trailing_widget,
      title_style,
      subtitle_style;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: 0,
      ),
      title: Text(title_text),
      titleTextStyle: title_style,
      subtitle: Text(subtitle_text),
      subtitleTextStyle: subtitle_style,
      trailing: trailing_widget,
    );
  }
}
