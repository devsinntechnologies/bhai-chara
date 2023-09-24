import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import '../../common/custom_text.dart';
import '../../utils/container.dart';
import '../post and detail/post_and_detail_1.dart';

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
                style: AppTextStyles.textStyleBoldSubTitleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      text: 'Gorilla',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'dormouse',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'ermine',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'armadillo',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'hedgehog',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'Indian rhinoceros',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'hedgehog',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'buffalo',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'giraffe',
                      tap: () {
                        push(context,const  PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'giraffe',
                      tap: () {
                        push(context, const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'elephant',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'Indian rhinoceros',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'buffalo',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'Japanese monkey',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                  CustomText(
                      text: 'giraffe',
                      tap: () {
                        push(context,const PostDetailScreen1());
                      }),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
