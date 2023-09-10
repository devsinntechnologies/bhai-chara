import 'dart:io';

import 'package:bhai_chara/common/custom_text.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/circle_avatar.dart';
import '../utils/container_with_img.dart';
import '../utils/text.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/images/Bhai Chara svg 1.png'),
                      height: 45,
                      width: 45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.my_location_outlined,
                            size: 24, color: Colors.white),
                        Text(
                          "Garden Town, Lahore",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Icon(
                      Icons.notifications,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                        child: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      hintText: "What are you looking for?",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: CustomText(
                  txt: 'LatesBrowse Categoriest',
                  fontsize: 24,
                  fontweight: FontWeight.w700,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCircleAvatar(
                      link: 'assets/images/fluent_animal-cat-28-filled.png',
                      col: Colors.amber,
                      txt: 'Animal',
                    ),
                    CustomCircleAvatar(
                        link: 'assets/images/basil_camera-solid.png',
                        col: Colors.amber,
                        txt: 'Electronic'),
                    CustomCircleAvatar(
                        link: 'assets/images/fontisto_mobile.png',
                        col: Colors.amber,
                        txt: 'Mobile'),
                    CustomCircleAvatar(
                        link: 'assets/images/map_furniture-store.png',
                        col: Colors.amber,
                        txt: 'Furniture'),
                    CustomCircleAvatar(
                        link: 'assets/images/ri_motorbike-fill.png',
                        col: Colors.amber,
                        txt: 'Bike'),
                    CustomCircleAvatar(
                        link: 'assets/images/solar_bell-bold.png',
                        col: Colors.amber,
                        txt: 'bell'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: CustomText(
                  txt: 'Latest',
                  fontsize: 24,
                  fontweight: FontWeight.w700,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomContainer(text: 'Rs 25000', secondText: 'Samsung S3', imgLink: 'assets/images/Rectangle 10.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Winter ', imgLink: 'assets/images/Rectangle 11.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Samsung S3', imgLink: 'assets/images/Rectangle 16.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Winter ', imgLink: 'assets/images/Rectangle 17.png')
                  ],
                ),
              ),
            
               Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                child: CustomText(
                  txt: 'Sals',
                  fontsize: 24,
                  fontweight: FontWeight.w700,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomContainer(text: 'Rs 25000', secondText: 'Samsung S3', imgLink: 'assets/images/Rectangle 16.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Winter', imgLink: 'assets/images/Rectangle 17.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Winter', imgLink: 'assets/images/Rectangle 10.png'),
                    CustomContainer(text: 'Rs 25000', secondText: 'Winter', imgLink: 'assets/images/Rectangle 11.png'),
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
