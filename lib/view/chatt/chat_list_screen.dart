import 'package:bhai_chara/utils/container.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/chatt/live_chatt_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ChattListScreen extends StatelessWidget {
  const ChattListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                text: "Chats",
                iconVar: Icons.arrow_back_ios,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextFormField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Type here",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                    for (int i = 0; i <= 15; i++)
                      InkWell(
                        onTap: () {
                          push(context, const LiveChattScreen());
                        },
                        child: ListTile(
                          leading: const CircleAvatar(radius: 25),
                          title: Text(
                            "Kashaf Waheed",
                            style: AppTextStyles.textStyleNormalBodyMedium,
                          ),
                          subtitle: Text(
                            "hello",
                            style: AppTextStyles.textStyleNormalBodyXSmall
                                .copyWith(color: AppColors.grey),
                          ),
                          trailing: Text(
                            "3/7/23",
                            style: AppTextStyles.textStyleNormalBodyXSmall
                                .copyWith(color: AppColors.grey),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
