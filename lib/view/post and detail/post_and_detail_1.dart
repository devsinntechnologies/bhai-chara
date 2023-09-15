import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/common/custom_text.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class PostDetailScreen1 extends StatefulWidget {
  const PostDetailScreen1({super.key});

  @override
  State<PostDetailScreen1> createState() => _PostDetailScreen1State();
}

class _PostDetailScreen1State extends State<PostDetailScreen1> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          toolbarHeight: 100,
          backgroundColor: AppColors.appbar,
          title: CustomText(
            text: "Include some details",
            fontsize: 26,
            fontweight: FontWeight.normal,
            color: AppColors.primary,
          ),
          leading: Icon(
            Icons.close,
            size: 30,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UPLOAD UP TO 20 PHOTOS",
              style: AppTextStyles.textStyleBoldBodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 180,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: AppColors.primary,
                          size: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Add images",
                          fontsize: 16,
                          fontweight: FontWeight.normal,
                          color: AppColors.primary,
                        ),
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Category*",
              style: AppTextStyles.textStyleBoldBodySmall,
            ),
            CustomListTile(
              back_color: AppColors.orangeColor,
              circular_radius: 34,
              circularwidget: Container(
                  height: 20,
                  width: 20,
                  child: const Center(
                      child: Image(
                    image: AssetImage("assets/images/cat_avatar.png"),
                    fit: BoxFit.contain,
                  ))),
              titletext: "Animal",
              titleStyle: AppTextStyles.textStyleBoldBodySmall,
              subtitleText: "Dogs",
              subtitleStyle: AppTextStyles.textStyleNormalBodyXSmall,
            ),
          ],
        ),
      ),
    );
  }
}
