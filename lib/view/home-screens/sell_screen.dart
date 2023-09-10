import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text.dart';
import 'package:flutter/material.dart';
import '../../utils/circle_avatar_row.dart';
import '../../utils/utils.dart';
import 'product_details_screen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

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
                const Padding(
                  padding:  EdgeInsets.only(left: 20),
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
          Column(
            children: [
              CustomCircleAvatarRow(
                link: 'assets/images/fluent_animal-cat-28-filled.png',
                col: Colors.amber,
                txt: 'Animal',
                ontap: () {
                  push(context,const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                  link: 'assets/images/basil_camera-solid.png',
                  col: Colors.amber,
                  txt: 'Electronic',
                   ontap: () {
                push(context,const ProductScreen());
              },),
              CustomCircleAvatarRow(
                  link: 'assets/images/fontisto_mobile.png',
                  col: Colors.amber,
                  txt: 'Mobile',
                   ontap: () {
                push(context,const ProductScreen());
              },),
              CustomCircleAvatarRow(
                  link: 'assets/images/map_furniture-store.png',
                  col: Colors.amber,
                  txt: 'Furniture',
                   ontap: () {
                  push(context,const ProductScreen());
                },),
              CustomCircleAvatarRow(
                  link: 'assets/images/ri_motorbike-fill.png',
                  col: Colors.amber,
                  txt: 'Bike',
                   ontap: () {
                  push(context,const ProductScreen());
                },),
              CustomCircleAvatarRow(
                  link: 'assets/images/solar_bell-bold.png',
                  col: Colors.amber,
                  txt: 'bell',
                   ontap: () {
                  push(context,const ProductScreen());
                },),
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
        ]),
      ),
    );
  }
}
