import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

class SubCategorieScreen extends StatelessWidget {
  const SubCategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(color: AppColors.darkBlue),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          size: 24,
                          color: AppColors.White,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("What are you offering?",
                        style: AppTextStyles.textStyleBoldBodyMedium
                            .copyWith(color: AppColors.White))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            child: Text("Categories",
                style: AppTextStyles.textStyleBoldSubTitleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Gorilla',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'dormouse',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'ermine',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'armadillo',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'hedgehog',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'Indian rhinoceros',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'hedgehog',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'buffalo',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'giraffe',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'elephant',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'hedgehog',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'elephant',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'Indian rhinoceros',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'buffalo',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'Japanese monkey',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
                Text(
                  'giraffe',
                  style: AppTextStyles.textStyleNormalBodyMedium,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
