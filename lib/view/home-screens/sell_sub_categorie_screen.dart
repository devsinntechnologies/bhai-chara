import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../../utils/container.dart';

class SubCategorieScreen extends StatelessWidget {
  const SubCategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomContainer(
            text: 'What are you offering?',
            iconVar: Icons.close,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 18, bottom: 15),
            child: Text("Sub-Categories",
                style: AppTextStyles.textStyleBoldSubTitleLarge.copyWith(fontFamily: 'Roboto-Light')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Gorilla',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2, fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'dormouse',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2, fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'ermine',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'armadillo',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'hedgehog',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'Indian rhinoceros',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'hedgehog',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'buffalo',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'giraffe',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'elephant',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'hedgehog',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'elephant',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'Indian rhinoceros',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'buffalo',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'Japanese monkey',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                  Text(
                    'giraffe',
                    style: AppTextStyles.textStyleNormalBodyMedium.copyWith(height: 2,fontFamily: 'Roboto-Light'),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
