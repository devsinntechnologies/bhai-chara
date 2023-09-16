import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/utils/utils.dart';
import 'package:bhai_chara/view/home-screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/circle_avatar.dart';
import '../../utils/container_with_img.dart';
import '../../utils/custom_textformfield.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.darkBlue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/Bhai Chara svg 1.png'),
                      height: 45,
                      width: 45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.my_location_outlined,
                            size: 24, color: Colors.white),
                        Text(
                          "Garden Town, Lahore",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.White),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      size: 24,
                      color: AppColors.White,
                    )
                  ],
                ),
              ),
             CustomTextFormField(),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: 
                Text('LatesBrowse Categoriest', style: AppTextStyles.textStyleBoldBodyMedium ,
                )
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCircleAvatar(
                      link: 'assets/images/fluent_animal-cat-28-filled.png',
                      col: AppColors.oange,
                      txt: 'Animal',
                    ),
                    CustomCircleAvatar(
                        link: 'assets/images/basil_camera-solid.png',
                        col: AppColors.yellow,
                        txt: 'Electronic'),
                    CustomCircleAvatar(
                        link: 'assets/images/fontisto_mobile.png',
                        col: AppColors.Green,
                        txt: 'Mobile'),
                    CustomCircleAvatar(
                        link: 'assets/images/map_furniture-store.png',
                        col: AppColors.pink,
                        txt: 'Furniture'),
                    CustomCircleAvatar(
                        link: 'assets/images/ri_motorbike-fill.png',
                        col: AppColors.blue,
                        txt: 'Bike'),
                    CustomCircleAvatar(
                        link: 'assets/images/solar_bell-bold.png',
                        col: AppColors.blue,
                        txt: 'bell'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: Text('Latest', style: AppTextStyles.textStyleBoldBodyMedium,)
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Samsung S3',
                      imgLink: 'assets/images/Rectangle 10.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter ',
                      imgLink: 'assets/images/Rectangle 11.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Samsung S3',
                      imgLink: 'assets/images/Rectangle 16.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter ',
                      imgLink: 'assets/images/Rectangle 17.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: Text('Sales', style: AppTextStyles.textStyleBoldBodyMedium,)
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Samsung S3',
                      imgLink: 'assets/images/Rectangle 16.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter',
                      imgLink: 'assets/images/Rectangle 17.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter',
                      imgLink: 'assets/images/Rectangle 10.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter',
                      imgLink: 'assets/images/Rectangle 11.png',
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
