// ignore_for_file: unnecessary_null_comparison

import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/provider/authentication_provider/auth_provider.dart';
import 'package:bhai_chara/provider/firebase/addproduct.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/refresh.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/utils/utils.dart';
import 'package:bhai_chara/view/home-screens/product_details_screen.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:bhai_chara/view/home-screens/sell_sub_categorie_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/custom_container_children.dart';
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
  // ignore: unused_field
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  TextEditingController searchController = TextEditingController();

  Future<Null> _refresh() {
    return getUser().then((_user) {
      // ignore: unused_local_variable
      User user;
      setState(() => user = _user);
    });
  }

  var selected = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              setState(() {
                push(context, RootScreen());
              });
              showSnack(context: context, text: "Page Refresh");
            });
          },
          child: Builder(builder: (context) {
            // ignore: unused_local_variable
            var pro = context.read<AuthProvider>();
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: AppColors.darkBlue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/images/Bhai Chara svg 1.png'),
                            height: 45,
                            width: 45,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.my_location_outlined,
                                  size: 24, color: Colors.white),
                              pro.isLoading == true
                                  ? CircularProgressIndicator.adaptive()
                                  : Text(
                                      pro.currentAddress.isEmpty
                                          ? "Oops! Error 404"
                                          : pro.currentAddress,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white),
                                      textAlign: TextAlign.center,
                                    )
                            ],
                          ),
                          Icon(
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
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 20, top: 15),
                        child: Text(
                          'Browse Categories',
                          style: AppTextStyles.textStyleBoldBodyMedium,
                        )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomCircleAvatar(
                            ontap: () {
                              push(context, SubCategorieScreen());
                            },
                            link:
                                'assets/images/fluent_animal-cat-28-filled.png',
                            col: AppColors.orange,
                            txt: 'Animal',
                          ),
                          CustomCircleAvatar(
                              ontap: () {
                                push(context, SubCategorieScreen());
                              },
                              link: 'assets/images/basil_camera-solid.png',
                              col: AppColors.yellow,
                              txt: 'Electronic'),
                          CustomCircleAvatar(
                              ontap: () {
                                push(context, SubCategorieScreen());
                              },
                              link: 'assets/images/fontisto_mobile.png',
                              col: AppColors.Green,
                              txt: 'Mobile'),
                          CustomCircleAvatar(
                              ontap: () {
                                push(context, SubCategorieScreen());
                              },
                              link: 'assets/images/map_furniture-store.png',
                              col: AppColors.pink,
                              txt: 'Furniture'),
                          CustomCircleAvatar(
                              ontap: () {
                                push(context, SubCategorieScreen());
                              },
                              link: 'assets/images/ri_motorbike-fill.png',
                              col: AppColors.blue,
                              txt: 'Bike'),
                          CustomCircleAvatar(
                              ontap: () {
                                push(context, SubCategorieScreen());
                              },
                              link: 'assets/images/solar_bell-bold.png',
                              col: AppColors.blue,
                              txt: 'bell'),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 20, top: 15),
                        child: Text(
                          'Latest',
                          style: AppTextStyles.textStyleBoldBodyMedium,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            selected = "All";
                            setState(() {});
                          },
                          child: CustomContainerText(
                            style: selected == "All"
                                ? AppTextStyles.textStyleNormalBodySmall
                                    .copyWith(color: AppColors.white)
                                : AppTextStyles.textStyleNormalBodyXSmall
                                    .copyWith(color: AppColors.black),
                            container_color:
                                selected == "All" ? AppColors.blue : null,
                            text: "All",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selected = "Free";
                            setState(() {});
                          },
                          child: CustomContainerText(
                            style: selected == "Free"
                                ? AppTextStyles.textStyleNormalBodySmall
                                    .copyWith(color: AppColors.white)
                                : AppTextStyles.textStyleNormalBodyXSmall
                                    .copyWith(color: AppColors.black),
                            container_color:
                                selected == "Free" ? AppColors.blue : null,
                            text: "Free",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selected = "Paid";
                            setState(() {});
                          },
                          child: CustomContainerText(
                            style: selected == "Paid"
                                ? AppTextStyles.textStyleNormalBodySmall
                                    .copyWith(color: AppColors.white)
                                : AppTextStyles.textStyleNormalBodyXSmall
                                    .copyWith(color: AppColors.black),
                            container_color:
                                selected == "Paid" ? AppColors.blue : null,
                            text: "Paid",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // StreamBuilder(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("Products")
                    //         .snapshots(),
                    //     builder: (context, AsyncSnapshot snapshot) {
                    //       var pro = context.read<ProductProvider>();

                    //       if (snapshot.hasData) {
                    //         QuerySnapshot data = snapshot.data;

                    //         return GridView.builder(
                    //           physics: NeverScrollableScrollPhysics(),
                    //           shrinkWrap: true,
                    //           itemCount: data.docs.length,
                    //           itemBuilder: (context, index) {
                    //             DocumentSnapshot dataDoc = data.docs[index];

                    //             if (selected == "All") {
                    //               return CustomContainerBox(
                    //                 isfree: dataDoc.get('isFree'),
                    //                 text: dataDoc.get('title'),
                    //                 secondText: dataDoc.get('description'),
                    //                 imgLink: NetworkImage(
                    //                     dataDoc.get('urlImage')[0]),
                    //                 ontap: () {
                    //                   push(
                    //                       context,
                    //                       ProductScreen(
                    //                         index: index,
                    //                       ));
                    //                 },
                    //               );
                    //             } else if (selected == "Free") {
                    //               if (dataDoc.get('isFree') == "Free") {
                    //                 return CustomContainerBox(
                    //                   isfree: dataDoc.get('isFree'),
                    //                   text: dataDoc.get('title'),
                    //                   secondText:
                    //                       dataDoc.get('description'),
                    //                   imgLink: NetworkImage(
                    //                       dataDoc.get('urlImage')[0]),
                    //                   ontap: () {
                    //                     push(
                    //                         context,
                    //                         ProductScreen(
                    //                           index: index,
                    //                         ));
                    //                   },
                    //                 );
                    //               }
                    //             } else {
                    //               if (dataDoc.get('isFree') != "Free") {
                    //                 return CustomContainerBox(
                    //                   isfree: dataDoc.get('isFree'),
                    //                   text: dataDoc.get('title'),
                    //                   secondText:
                    //                       dataDoc.get('description'),
                    //                   imgLink: NetworkImage(
                    //                       dataDoc.get('urlImage')[0]),
                    //                   ontap: () {
                    //                     push(
                    //                         context,
                    //                         ProductScreen(
                    //                           index: index,
                    //                         ));
                    //                   },
                    //                 );
                    //               }
                    //             }
                    //           },
                    //           gridDelegate:
                    //               SliverGridDelegateWithFixedCrossAxisCount(
                    //                   crossAxisCount: 2),
                    //         );
                    //       } else
                    //         return Center(
                    //             child:
                    //                 CircularProgressIndicator.adaptive());
                    //     }),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Products")
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          QuerySnapshot data = snapshot.data;
                          List<DocumentSnapshot> filteredData = [];

                          for (int index = 0;
                              index < data.docs.length;
                              index++) {
                            DocumentSnapshot dataDoc = data.docs[index];
                            bool isFree = dataDoc.get('isFree');
                            if (selected == "All" ||
                                (selected == "Free" && isFree) ||
                                (selected == "Paid" && !isFree)) {
                              filteredData.add(dataDoc);
                            }
                          }

                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filteredData.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot dataDoc = filteredData[index];

                              return CustomContainerBox(
                                isfree: dataDoc.get('isFree'),
                                text: dataDoc.get('title'),
                                secondText: dataDoc.get('description'),
                                imgLink:
                                    NetworkImage(dataDoc.get('urlImage')[0]),
                                ontap: () {
                                  push(
                                    context,
                                    ProductScreen(
                                      index: index,
                                    ),
                                  );
                                },
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          );
                        } else {
                          return Center(
                              child: CircularProgressIndicator.adaptive());
                        }
                      },
                    ),

                    // selected == "Paid"
                    //     ? StreamBuilder(
                    //         stream: FirebaseFirestore.instance
                    //             .collection("Products")
                    //             .snapshots(),
                    //         builder: (context, AsyncSnapshot snapshot) {
                    //           var pro = context.read<ProductProvider>();

                    //           if (snapshot.hasData) {
                    //             QuerySnapshot data = snapshot.data;

                    //             return GridView.builder(
                    //               physics: NeverScrollableScrollPhysics(),
                    //               shrinkWrap: true,
                    //               itemCount: data.docs.length,
                    //               itemBuilder: (context, index) {
                    //                 DocumentSnapshot dataDoc = data.docs[index];
                    //                 if (dataDoc.get('isFree') != "Free") {
                    //                   return CustomContainerBox(
                    //                     isfree: dataDoc.get('isFree'),
                    //                     text: dataDoc.get('title'),
                    //                     secondText: dataDoc.get('description'),
                    //                     imgLink: NetworkImage(
                    //                         dataDoc.get('urlImage')[0]),
                    //                     ontap: () {
                    //                       push(
                    //                           context,
                    //                           ProductScreen(
                    //                             index: index,
                    //                           ));
                    //                     },
                    //                   );
                    //                 }
                    //               },
                    //               gridDelegate:
                    //                   SliverGridDelegateWithFixedCrossAxisCount(
                    //                       crossAxisCount: 2),
                    //             );
                    //           } else
                    //             return Center(
                    //                 child:
                    //                     CircularProgressIndicator.adaptive());
                    //         })
                    //     : Text(''),

                    // Padding(
                    //     padding:
                    //         const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                    //     child: Text(
                    //       'Sales',
                    //       style: AppTextStyles.textStyleBoldBodyMedium,
                    //     )),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       CustomContainer(
                    //         text: 'Rs 25000',
                    //         secondText: 'Samsung S3',
                    //         imgLink: AssetImage('assets/images/Rectangle 16.png'),
                    //         ontap: () {
                    //           push(context, ProductScreen());
                    //         },
                    //       ),
                    //       CustomContainer(
                    //         text: 'Rs 25000',
                    //         secondText: 'Winter',
                    //         imgLink: AssetImage('assets/images/Rectangle 17.png'),
                    //         ontap: () {
                    //           push(context, ProductScreen());
                    //         },
                    //       ),
                    //       CustomContainer(
                    //         text: 'Rs 25000',
                    //         secondText: 'Winter',
                    //         imgLink: AssetImage('assets/images/Rectangle 10.png'),
                    //         ontap: () {
                    //           push(context, ProductScreen());
                    //         },
                    //       ),
                    //       CustomContainer(
                    //         text: 'Rs 25000',
                    //         secondText: 'Winter',
                    //         imgLink: AssetImage('assets/images/Rectangle 11.png'),
                    //         ontap: () {
                    //           push(context, ProductScreen());
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
