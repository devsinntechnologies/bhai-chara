import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class HelpAndSportsScreen extends StatefulWidget {
  const HelpAndSportsScreen({super.key});

  @override
  State<HelpAndSportsScreen> createState() => _HelpAndSportsScreenState();
}

class _HelpAndSportsScreenState extends State<HelpAndSportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.App,
        leading: const Icon(
          Icons.arrow_back_ios,
          // color: AppColors.primary,
          color: AppColors.primary,
          size: 24,
        ),
        title: Text(
          "Helps & Sports",
          style: AppTextStyles.textStyleNormalLargeTitle
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            for (int i = 0; i < 3; i++)
              Column(
                children: [
                  Row(
                    children: [
                      // 1 columnn
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Feedback",
                              style: AppTextStyles.textStyleBoldBodyMedium),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Take a moment to let us know how we're going ",
                            style: AppTextStyles.textStyleNormalBodyXSmall,
                          ),
                        ],
                      ),
                      Spacer(),
                      // 2columnn....
                      Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 24,
                            color: AppColors.TextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 2,
                    color: AppColors.dividerColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
