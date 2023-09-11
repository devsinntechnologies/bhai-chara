import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ChattListScreen extends StatelessWidget {
  const ChattListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 200,
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
            for (int i = 0; i <= 10; i++)
              ListTile(
                leading: CircleAvatar(radius: 15),
                title: Text(
                  "Kashaf Waheed",
                  style: AppTextStyles.textStyleBoldBodyMedium,
                ),
                subtitle: Text(
                  "hello",
                  style: AppTextStyles.textStyleNormalBodySmall
                      .copyWith(color: AppColors.grey),
                ),
                trailing: Text(
                  "3/7/23",
                  style: AppTextStyles.textStyleNormalBodySmall
                      .copyWith(color: AppColors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
