import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/post%20and%20detail/post_and_detail_1.dart';
import 'package:flutter/material.dart';

import '../../utils/container.dart';

class SubCategorieScreen extends StatefulWidget {
  const SubCategorieScreen({super.key});

  @override
  State<SubCategorieScreen> createState() => _SubCategorieScreenState();
}

class _SubCategorieScreenState extends State<SubCategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomContainer(
              text: 'What are you offering?',
              iconVar: Icons.close,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 18, bottom: 15),
              child: Text("Sub-Categories",
                  style: AppTextStyles.textStyleBoldSubTitleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('Gorilla',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('dormouse',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('ermine',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('armadillo',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('hedgehog',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('Indian rhinoceros',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('hedgehog',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('buffalo',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('giraffe',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('elephant',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('hedgehog',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('elephant',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('Indian rhinoceros',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('buffalo',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('Japanese monkey',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, PostDetailScreen1());
                      },
                      child: Text('giraffe',
                          style: AppTextStyles.textStyleNormalBodyMedium),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
