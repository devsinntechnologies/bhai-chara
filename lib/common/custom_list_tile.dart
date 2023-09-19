import 'package:bhai_chara/utils/text-styles.dart';
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
      this.subtitleStyle,required this.tap,
      this.titleStyle});
  var circular_radius,
      back_image,
      circularwidget,
      back_color,
      titletext,
      subtitleText,
      end_icon_widget,
      titleStyle,
      subtitleStyle, tap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: back_color,
                radius: circular_radius,
                child: circularwidget),
            const SizedBox(
              width: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titletext,
                    style: titleStyle,
                  ),
                  Text(
                    subtitleText,
                    style: subtitleStyle,
                  )
                ],
              ),
            )
          ],
        ),
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
      minLeadingWidth: 0,
      leading: leading_widget,
      title: Text(title_text),
      // titleTextStyle: title_style,
      subtitle: Text(subtitle_text),
      // subtitleTextStyle: subtitle_style,
      trailing: trailing_widget,
    );
  }
}

// ignore: must_be_immutable
class CustomListAccountTile extends StatelessWidget {
  CustomListAccountTile(
      {super.key,
      this.asset_image,
      this.subtitle_style,
      this.subtitle_text,
      this.title_style,
      this.title_text});
  var asset_image, title_text, subtitle_text, title_style, subtitle_style;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Image(
                  image: asset_image,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title_text, style: title_style),
              Text(
                subtitle_text,
                style: subtitle_style,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  CustomTile({super.key, this.subtitle_widget, this.title_widget});
  var title_widget, subtitle_widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            title_widget,
            size: 20,
            color: Color(0xfa808080),
          ),
          Text(
            subtitle_widget,
            style: AppTextStyles.textStyleSubtitleSmallBody,
          )
        ],
      ),
    );
  }
}
