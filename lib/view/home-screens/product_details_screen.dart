import 'package:bhai_chara/provider/authentication_provider/auth_provider.dart';
import 'package:bhai_chara/utils/custom_loader.dart';
import 'package:bhai_chara/view/request_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhai_chara/common/custom_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';
import '../../utils/utils.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, this.index});
  var index;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder<Object>(
              stream:
                  FirebaseFirestore.instance.collection("Products").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                QuerySnapshot data = snapshot.data;
                DocumentSnapshot dataDoc = data.docs[widget.index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      // value = widget.index,
                      widget.index == null
                          ? Center(child: CustomLoader())
                          : StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Products")
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  QuerySnapshot data = snapshot.data;

                                  DocumentSnapshot dataDoc =
                                      data.docs[widget.index];

                                  return CarouselSlider.builder(
                                    carouselController: CarouselController(),
                                    options: CarouselOptions(
                                      height: 300,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      // onPageChanged:,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                    itemCount: dataDoc.get('urlImage').length,
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        Container(
                                      height: 300,
                                      width: double.infinity,
                                      child: Image(
                                        image: NetworkImage(
                                            dataDoc.get('urlImage')[itemIndex]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }

                                return const Center(
                                    child: Center(child: CustomLoader()));
                              }),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: widget.index == null
                                      ? AppColors.black
                                      : Color.fromARGB(255, 223, 81, 15),
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.forward,
                                  color: widget.index == null
                                      ? AppColors.black
                                      : Color.fromARGB(255, 223, 81, 15),
                                ))
                          ],
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 25),
                      child: Row(
                        children: [
                          Text(
                            "Rs: ",
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                          Text(
                            dataDoc.get('price') == null
                                ? "Free"
                                : dataDoc.get('price'),
                            style: AppTextStyles.textStyleBoldBodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8),
                      child: Text(
                        dataDoc.get('category'),
                        style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 25, right: 20),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          Builder(builder: (context) {
                            var loc = context.watch<AuthProvider>();
                            return loc.isLoading
                                ? Center(
                                    child: CustomLoader(),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Text(
                                      loc.currentAddress,
                                      style: AppTextStyles
                                          .textStyleBoldBodySmall
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                    ));
                          }),
                          const Spacer(),
                          Text(
                            '18/08/2023',
                            style: AppTextStyles.textStyleNormalBodyXSmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 25),
                      child: Text(
                        'Details',
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brand:',
                                style: AppTextStyles.textStyleBoldBodySmall
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Condition:',
                                style: AppTextStyles.textStyleBoldBodySmall
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataDoc.get('subcategory'),
                                  style: AppTextStyles.textStyleBoldBodySmall
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Open Box',
                                  style: AppTextStyles.textStyleBoldBodySmall
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 25),
                      child: Text(
                        'Description',
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 8, bottom: 10),
                      child: Text(
                        dataDoc.get('description'),
                        style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Rectangle 10.png'),
                      ),
                      title: Text('Laiba Azam',
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      subtitle: Text(
                        'Member since Jul 2018',
                        style: AppTextStyles.textStyleNormalBodySmall,
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 25),
                      child: Text(
                        'Location',
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          Builder(builder: (context) {
                            var loc2 = context.watch<AuthProvider>();
                            return Container(
                                width: 180,
                                child: Text(
                                  loc2.currentAddress,
                                  style: AppTextStyles.textStyleBoldBodySmall
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ));
                          }),
                        ],
                      ),
                    ),
                    Container(
                      height: 190,
                      width: double.infinity,
                      child: const Image(
                          image: AssetImage('assets/images/HILmr (1).png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 8),
                      child: Text('Your safety matters to us!',
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                    // Wrap the UnorderedList with a ListView
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        'Only meet in public / crowded places',
                        'Never go alone to meet a buyer / seller, always take someone with you.',
                        'Check and inspect the product properly before purchasing it.',
                        'Never pay anything in advance or transfer money before inspecting the product.',
                      ]
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 3,
                                        backgroundColor: AppColors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SizedBox(
                                        width: 280,
                                        child: Text(
                                          item,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),

                    // CustomList(text: "Only meet in public / crowded places"),
                    // CustomList(text: "Never go alone to meet a buyer / seller, always take someone with you."),
                    // CustomList(text: "Check and inspect the product properly before purchasing it."),
                    // CustomList(text: "Never pay anything in advance or transfer money before inspecting the product."),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomButton(
                        onTap: () {
                          pushUntil(context, RequestScreen());
                        },
                        text: "Request",
                      ),
                    ),
                    // SizedBox(
                    //     height: 20,
                    //   ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  // ignore: unu
}
