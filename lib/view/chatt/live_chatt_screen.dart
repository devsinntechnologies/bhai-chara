import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../../common/custom_messagefield.dart';

class LiveChattScreen extends StatelessWidget {
  const LiveChattScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          elevation: 0,
          leadingWidth: 20,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kashaf",
                      style: AppTextStyles.textStyleNormalBodySmall
                          .copyWith(color: AppColors.white)),
                  Text("online",
                      style: AppTextStyles.textStyleNormalBodyXSmall
                          .copyWith(color: AppColors.white)),
                ],
              )
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.skyblue,
              Colors.white,
            ], begin: Alignment.bottomLeft),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTextMesg("Hi, how are you doing today"),
                    BuildTextMesg("I'm good too, what's up?"),
                    BuildReceiveMesg("Nothing speciall"),
                    BuildReceiveMesg("What's going on?"),
                    BuildTextMesg("Working "),
                    BuildReceiveMesg("That's good"),
                    BuildReceiveMesg(
                        "That's good\n asdfghjklswedrtyuiozxcvbnhat's good asdfgh\njklswedrtyuiozxcvbnm,werftowerha\nt's at's good asdfghjklswedrty\nuiozxcvbnhat's good asdfghjklswed\nrtyuiozxcvbnm,werftowerhat's good a\nsdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghj\nklswedrtyuiozxcvbn\nm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,we\nrftowerm,werftowertyuiohat's good asdfghjklswedrty\nuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerogood a\nsdfghjklswedrtyuiozxcvbnm,werftowerhat's g\nood asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswed\nrtyuiozxcvbnm,werftowerm,werftowertyui\nohat's good asdfghjklswedrtyuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerozxcvbnm,werftower"),
                    BuildTextMesg(
                        "That's good asdfghjklswedat's good asdfghjklswedrtyuiozxcvbnhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerm,werftowertyuiohat's good asdfghjklswedrtyuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerortyuiozxcvbnhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerm,werftowertyuiohat's good asdfghjklswedrtyuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerozxcvbnm,werftower"),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:const  EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.lightblue),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(5),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
