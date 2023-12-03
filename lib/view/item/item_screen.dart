import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/provider/firebase/addproduct.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/custom_loader.dart';
import 'package:bhai_chara/utils/itemContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_container.dart';
import '../../utils/push.dart';
import '../../utils/text-styles.dart';
import '../account/account_screen.dart';
import '../help_and_sports_screen.dart';
import '../home-screens/product_details_screen.dart';
import '../settings-screens/manage_account_screen.dart';
import '../settings-screens/setting_screen.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var currentIndex;
    // ignore: unused_local_variable
    final pages = [
      const AccountScreen(),
      const ItemScreen(),
      const HelpAndSportsScreen(),
      const ManageAccountScreen(),
      const SettingScreen(),
    ];
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Products").snapshots(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomContainer(context, "Items"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomContainerTile(
                            ontap: () {},
                            height: 40.0,
                            width: 100.0,
                            chil_widget: const Icon(
                              Icons.tune,
                              size: 20,
                              color: AppColors.grey,
                            ),
                            text: "Filter",
                            style_text:
                                AppTextStyles.textStyleNormalXLBodySmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Products")
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                var pro = context.watch<ProductProvider>();
                                if (snapshot.hasData) {
                                  QuerySnapshot data = snapshot.data;

                                  return pro.isLoading
                                      ? Center(child: CustomLoader())
                                      : ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: data.docs.length,
                                          itemBuilder: (context, index) {
                                            DocumentSnapshot dataDoc =
                                                data.docs[index];
                                            var isFree = dataDoc.get('isFree')
                                                ? "Free"
                                                : dataDoc.get('price');
                                            return ItemContainer(
                                              subcategory:
                                                  dataDoc.get('subcategory'),
                                              category: dataDoc.get('category'),
                                              imageLink:
                                                  dataDoc.get('urlImage')[0],
                                              titleText: isFree,
                                              ontap: () {
                                                push(
                                                    context,
                                                    ProductScreen(
                                                      index: index,
                                                    ));
                                              },
                                            );
                                          },
                                        );
                                } else
                                  return Center(
                                    child: CustomLoader(),
                                  );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
