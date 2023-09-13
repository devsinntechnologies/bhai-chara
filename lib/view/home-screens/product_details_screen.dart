import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/text-styles.dart';

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
                  child: Image(
                    image: AssetImage('assets/images/Rectangle 16.png'),
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.White,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.forward,
                            color: AppColors.White,
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
                    Icon(
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
                    Spacer(),
                    Text(
                      '18/08/2023',
                      style: AppTextStyles.textStyleBoldBodySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  'Details',
                  style: AppTextStyles.textStyleBoldBodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
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
                  style: AppTextStyles.textStyleBoldBodyMedium,
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
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Rectangle 10.png'),
                ),
                title: Text('Laiba Azam',
                    style: AppTextStyles.textStyleBoldBodyMedium
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
                subtitle: Text(
                  'Member since Jul 2018',
                  style: AppTextStyles.textStyleNormalBodySmall,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  'Location',
                  style: AppTextStyles.textStyleBoldBodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
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
                child: Image(image: AssetImage('assets/images/HILmr (1).png')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Your safety matters to us!',
                    style: AppTextStyles.textStyleBoldBodyMedium
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
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text('•',
                                  style:
                                      AppTextStyles.textStyleBoldSubTitleLarge),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  item,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
