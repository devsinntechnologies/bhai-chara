import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/utils/utils.dart';
import 'package:bhai_chara/view/home-screens/product_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/circle_avatar.dart';
import '../../utils/container_with_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List data = [];
  TextEditingController searchController = TextEditingController();
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
                              color: AppColors.white),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      size: 24,
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: CustomTextField(
                    prfixicon: Icon(Icons.search),
                    prefixcolor: AppColors.Grey,
                    controller: searchController,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "What are you looking for?",
                    obsecuretext: false),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                  child: Text(
                    'Browse Categories',
                    style: AppTextStyles.textStyleBoldBodyMedium,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCircleAvatar(
                      link: 'assets/images/fluent_animal-cat-28-filled.png',
                      col: AppColors.orange,
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
                  child: Text(
                    'Latest',
                    style: AppTextStyles.textStyleBoldBodyMedium,
                  )),
              Center(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        QuerySnapshot data = snapshot.data;

                        return GridView.builder(
                          shrinkWrap: true,
                          // scrollDirection: Axis.horizontal,
                          itemCount: data.docs.length,

                          itemBuilder: (context, index) {
                            DocumentSnapshot dataDoc = data.docs[index];
                            return CustomContainer(
                              text: dataDoc.get('title'),
                              secondText: dataDoc.get('description'),
                              imgLink: NetworkImage(dataDoc.get('urlImage')[0]),
                              ontap: () {
                                push(context, const ProductScreen());
                              },
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        );
                      }
                      return CircularProgressIndicator.adaptive();
                    }),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                  child: Text(
                    'Sales',
                    style: AppTextStyles.textStyleBoldBodyMedium,
                  )),
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
                      imgLink: AssetImage('assets/images/Rectangle 17.png'),
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter',
                      imgLink: AssetImage('assets/images/Rectangle 10.png'),
                      ontap: () {
                        push(context, const ProductScreen());
                      },
                    ),
                    CustomContainer(
                      text: 'Rs 25000',
                      secondText: 'Winter',
                      imgLink: AssetImage('assets/images/Rectangle 11.png'),
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
