import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/container.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/custom_button.dart';
import '../provider/switch_provider.dart';

class PostDetailScreen2 extends StatefulWidget {
  const PostDetailScreen2({super.key});

  @override
  State<PostDetailScreen2> createState() => _PostDetailScreen2State();
}

class _PostDetailScreen2State extends State<PostDetailScreen2> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomContainer(
            text: "Review your details",
            iconVar: Icons.close,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/profile_photo.png"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Name",
                          style: AppTextStyles.textStyleBoldXLBodySmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: size.width * .70,
                          child: CustomTextField(
                              controller: nameController,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "Type here",
                              obsecuretext: false),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Verified Phone Number",
                      style: AppTextStyles.textStyleBoldBodyXSmall,
                    ),
                    const Spacer(),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfa000000)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.done_outlined,
                          color: Color(0xfa000000),
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("+92311-6743657",
                        style: AppTextStyles.textStyleBoldBodyXSmall),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Show my phone number in ads",
                        style: AppTextStyles.textStyleTitleBodySmall,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Consumer<SwitchProvider>(
                      builder: (context, pro, _) {
                        return Switch(
                          activeColor: AppColors.white,
                          activeTrackColor: AppColors.blue,
                          value: pro.on,
                          onChanged: (newValue) {
                            pro.toggle();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(20),
            child: CustomButton(
              onTap: () {
                if (nameController.text.isEmpty) {
                  showSnack(text: "Please Enter Name Field", context: context);
                } else {
                  push(context, RootScreen());
                }
              },
              text: "Post Now",
            ),
          ),
        ],
      ),
    ));
  }
}
        // appBar: AppBar(
        //   backgroundColor: AppColors.black,
        //   title: const Text("Review your details"),
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(Icons.close),
        //     color: AppColors.white,
        //   ),
        // ),
        // body: Container(
        //   child: Column(
        //     children: [
        //       CustomContainer(
        //         text: "Review your details",
        //         iconVar: Icons.close,
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 CustomListAccountTile(
        //                   asset_image: const AssetImage(
        //                       "assets/images/profile_photo.png"),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
              // const CircleAvatar(
              //   radius: 40,
              // ),
              // const SizedBox(width: 15),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Your name",
              //       style: AppTextStyles.textStyleBoldBodyXSmall,
              //     ),
              //     const SizedBox(
              //       height: 5,
              //     ),
              //     Container(
              //         margin: EdgeInsets.only(bottom: 50),
              //         width: size.width * .70,
              //         height: 50,
              //         child: CustomTextField(
              //           controller: nameController,
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15)),
              //           hintText: "Type here",
              //           obsecuretext: false,
              //         )
              //         // TextFormField(
              //         //     decoration: InputDecoration(
              //         //   border: OutlineInputBorder(
              //         //       borderRadius: BorderRadius.circular(15)),
              //         //   hintText: "Type here",
              //         //   hintStyle: const TextStyle(
              //         //       fontSize: 16, fontWeight: FontWeight.w400),
              //         // )),
              //         ),
              //     Row(
              //       children: [
              //         Text(
              //           "Verified phone number",
              //           style: AppTextStyles.textStyleBoldBodyXSmall,
              //         )
              //       ],
              //     )
              //   ],
              // ),
              // Row(children: [
              //   Text("Verified phone number",
              //       style: AppTextStyles.textStyleBoldBodyXSmall),
              //   const Spacer(),
              //   const Icon(Icons.done_outlined),
              //   const SizedBox(
              //     width: 8,
              //   ),
              //   Text("0311-6743657",
              //       style: AppTextStyles.textStyleBoldBodyXSmall),
              // ]),
              // Row(children: [
              //   Text("Show my phone number on ads",
              //       style: AppTextStyles.textStyleBoldBodyXSmall),
              //   // ),
              //   const Spacer(),
              //   Consumer<SwitchProvider>(
              //     builder: (context, pro, _) {
              //       return Switch(
              //         value: pro.on,
              //         onChanged: (newValue) {
              //           pro.toggle(); // Call the toggle method when the switch is changed
              //         },
              //       );
              //     },
              //   ),
              // ]),
              // const Spacer(),
              // CustomButton(
              //   text: "Post Now",
              // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
