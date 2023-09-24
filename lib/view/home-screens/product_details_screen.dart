import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/text-styles.dart';
import '../../utils/utils.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child:const  Image(
                    image: AssetImage('assets/images/Rectangle 16.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.forward,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  'Rs 40,000',
                  style: AppTextStyles.textStyleBoldBodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Text(
                  'Spark 10c',
                  style: AppTextStyles.textStyleBoldBodySmall
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 30,
                    ),
                    Container(
                        width: 180,
                        child: Text(
                          'Garden Town-Aibak Block, Lahore',
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
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
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Condition:',
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tecno',
                            style: AppTextStyles.textStyleBoldBodySmall
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Open Box',
                            style: AppTextStyles.textStyleBoldBodySmall
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
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
                padding: const EdgeInsets.only(left: 20, top: 8, bottom: 10),
                child: Text(
                  '11 month warranty',
                  style: AppTextStyles.textStyleBoldBodySmall
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Rectangle 10.png'),
                ),
                title: Text('Laiba Azam',
                    style: AppTextStyles.textStyleBoldBodySmall
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 30,
                    ),
                    Container(
                        width: 180,
                        child: Text(
                          'Garden Town-Aibak Block, Lahore',
                          style: AppTextStyles.textStyleBoldBodySmall.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
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
                    style: AppTextStyles.textStyleBoldBodySmall
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              // Wrap the UnorderedList with a ListView
              ListView(
                shrinkWrap: true,
                children: [
                  'Only meet in public / crowded places',
                  'Never go alone to meet a buyer / seller, always take someone with you.',
                  'Check and inspect the product properly before purchasing it.',
                  'Never pay anything in advance or transfer money before inspecting the product.',
                ]
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: 250,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'SMS',
                    icon: Icons.email,
                  ),
                  CustomButton(
                    text: 'Call',
                    icon: Icons.phone,
                  ),
                  CustomButton(
                    text: 'Chat',
                    icon: Icons.chat,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
