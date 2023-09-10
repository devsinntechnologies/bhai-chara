import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/circle_avatar.dart';
import '../utils/circle_avatar_row.dart';
import '../utils/utils.dart';
import 'product_details.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(
                  txt: 'What are you offering?',
                  fontsize: 24,
                  fontweight: FontWeight.w600,
                  col: Colors.white,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
          child: CustomText(
            txt: 'Categories',
            fontsize: 24,
            fontweight: FontWeight.w600,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                  link: 'assets/images/fluent_animal-cat-28-filled.png',
                  col: Colors.amber,
                  txt: 'Animal',
                ),
              ),
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                    link: 'assets/images/basil_camera-solid.png',
                    col: Colors.amber,
                    txt: 'Electronic'),
              ),
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                    link: 'assets/images/fontisto_mobile.png',
                    col: Colors.amber,
                    txt: 'Mobile'),
              ),
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                    link: 'assets/images/map_furniture-store.png',
                    col: Colors.amber,
                    txt: 'Furniture'),
              ),
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                    link: 'assets/images/ri_motorbike-fill.png',
                    col: Colors.amber,
                    txt: 'Bike'),
              ),
              InkWell(
                onTap: () {
                  push(context, ProductScreen());
                },
                child: CustomCircleAvatarRow(
                    link: 'assets/images/solar_bell-bold.png',
                    col: Colors.amber,
                    txt: 'bell'),
              ),
            //   CustomCircleAvatarRow(
            //       link: 'assets/images/ri_motorbike-fill.png',
            //       col: Colors.amber,
            //       txt: 'Bike'),
            //   CustomCircleAvatarRow(
            //       link: 'assets/images/solar_bell-bold.png',
            //       col: Colors.amber,
            //       txt: 'bell'),
             ],
          ),
        ),
      ]),
    );
  }
}
