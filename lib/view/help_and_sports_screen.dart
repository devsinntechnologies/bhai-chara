// import 'package:bhai_chara/utils/push.dart';
// import 'package:flutter/material.dart';

// import '../common/custom_container.dart';
// import '../common/custom_listtile.dart';
// import '../utils/app_colors.dart';

// class HelpAndSportsScreen extends StatefulWidget {
//   const HelpAndSportsScreen({super.key});

//   @override
//   State<HelpAndSportsScreen> createState() => _HelpAndSportsScreenState();
// }

// class _HelpAndSportsScreenState extends State<HelpAndSportsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Column(
//         children: [
//           CustomContainer(context, "Help And Supports"),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//              padding:const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 CustomListTileSetting(
//                   tap: () {
//                     BottomSheetFunction(context);
//                   },
//                   heading: "Feedback",
//                   data: 'Take a moment to let us konw how we’re doing',
//                   iconTwo: Icons.arrow_forward_ios,
//                 ),
//                 CustomListTileSetting(
//                   tap: () {},
//                   heading: "Invite friends to Bhai Chara",
//                   data: 'Invite your friends to buy and sell',
//                   iconTwo: Icons.arrow_forward_ios,
//                 ),
//                 CustomListTileSetting(
//                   tap: () {},
//                   heading: "Version",
//                   data: '23.1',
//                   iconTwo: Icons.arrow_forward_ios,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text-styles.dart';

class HelpAndSportsScreen extends StatefulWidget {
  const HelpAndSportsScreen({super.key});

  @override
  State<HelpAndSportsScreen> createState() => _HelpAndSportsScreenState();
}

class _HelpAndSportsScreenState extends State<HelpAndSportsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primary,
          // appBar: AppBar(
          //   backgroundColor: AppColors.App,
          //   leading: Icon(
          //     Icons.arrow_back_ios,
          //     // color: AppColors.primary,
          //     color: AppColors.primary,
          //     size: 24,
          //   ),
          //   title: Text(
          //     "Helps & Sports",
          //     style: AppTextStyles.textStyleNormalLargeTitle
          //         .copyWith(color: AppColors.primary),
          //   ),
          // ),

          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: size.width,
                height: 80,
                color: AppColors.App,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Help & Sports",
                      style: AppTextStyles.textStyleNormalBodyMedium,
                    ),
                  ],
                ),
              ),

              // 2 main columnn
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    for (int i = 0; i < 3; i++)
                      Column(
                        children: [
                          Row(
                            children: [
                              // 1 columnn
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Feedback",
                                      style: AppTextStyles
                                          .textStyleBoldBodyMedium),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: size.width*.75,
                                    child: Text(
                                      "Take a moment to let us know how we're going ",
                                      style:
                                          AppTextStyles.textStyleNormalBodyXSmall,
                                          maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              // 2columnn....
                              Column(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 24,
                                    color: AppColors.TextColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColors.dividerColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}


/**/
     







/*
*/