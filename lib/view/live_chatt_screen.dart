import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../common/custom_messagefield.dart';

class LiveChattScreen extends StatelessWidget {
  const LiveChattScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        leading: const Icon(Icons.arrow_back_ios),
        elevation: 0,
       leadingWidth: 60,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.phone),
          ),
        ],
        title: Row(
          children: [
           const  CircleAvatar(
              radius: 20,
            ),
           const  SizedBox(
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
          gradient: LinearGradient(colors: [ AppColors.skyblue,Colors.white],begin: Alignment.bottomLeft),),
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
                  BuildReceiveMesg("That's good asdfghjklswedrtyuiozxcvbnhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerm,werftowertyuiohat's good asdfghjklswedrtyuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerozxcvbnm,werftower\n\n\n\n\n"),
                  BuildTextMesg("That's good asdfghjklswedrtyuiozxcvbnhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerhat's good asdfghjklswedrtyuiozxcvbnm,werftowerm,werftowertyuiohat's good asdfghjklswedrtyuihat's good asdfghjklswedrtyuiozxcvbnm,werftowerozxcvbnm,werftower\n\n\n\n\n"),
          
                  
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Container(
                    margin:const  EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(5),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file),
                        ),
                      
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
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                  child: CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: AppColors.white,
                      ),
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
