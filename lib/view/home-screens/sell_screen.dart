import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import '../../utils/circle_avatar_row.dart';
import '../../utils/container.dart';
import '../../utils/utils.dart';
import 'product_details_screen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

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
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                "Categories",
                style: AppTextStyles.textStyleBoldBodyMedium,
              )),
          Column(
            children: [
              CustomCircleAvatarRow(
                link: 'assets/images/fluent_animal-cat-28-filled.png',
                col: AppColors.yellow,
                txt: 'Animal',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                link: 'assets/images/basil_camera-solid.png',
                col: AppColors.oange,
                txt: 'Electronic',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                link: 'assets/images/fontisto_mobile.png',
                col: AppColors.Green,
                txt: 'Mobile',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                link: 'assets/images/map_furniture-store.png',
               col: AppColors.pink,
                txt: 'Furniture',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                link: 'assets/images/ri_motorbike-fill.png',
                col: AppColors.yellow,
                txt: 'Bike',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
              CustomCircleAvatarRow(
                link: 'assets/images/solar_bell-bold.png',
                col: AppColors.blue,
                txt: 'bell',
                ontap: () {
                  push(context, const ProductScreen());
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
