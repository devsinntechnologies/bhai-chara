import 'dart:math';

import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/home-screens/sell_sub_categorie_screen.dart';
import 'package:bhai_chara/view/post%20and%20detail/post_and_detail_1.dart';
import 'package:flutter/material.dart';
// import '../../common/custom_container_tile.dart';
import '../../common/custom_container_tile.dart';
import '../../utils/circle_avatar_row.dart';
import '../../utils/container.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final List<Color> myColors = [
    Color(0xfaF7931E),
    Color.fromARGB(255, 247, 147, 30),
    Color.fromARGB(255, 254, 192, 15),
    Color.fromARGB(255, 57, 181, 74),
    Color.fromARGB(255, 238, 42, 123),
    Color.fromARGB(255, 39, 170, 225),
    Color.fromARGB(255, 128, 128, 128),
    Color.fromARGB(255, 179, 179, 179),
    Color.fromARGB(255, 101, 101, 101),
    Color.fromARGB(255, 202, 93, 93),
    Color.fromARGB(255, 226, 70, 200),
    Color.fromARGB(248, 6, 110, 29),
    Colors.cyan,
    Color(0xff001B26),
    Color(0xfa001B26),
    Color.fromARGB(255, 0, 27, 38),
    Colors.black,
    Color(0xff000000),
    Color.fromARGB(249, 70, 2, 17),
  ];
  List<String> SellCategory = [
    "Animal",
    "Electronic",
    "Mobile",
    "Furniture",
    "Bike",
    "Bell",
  ];
  List<String> Selling = [
    'assets/images/fluent_animal-cat-28-filled.png',
    'assets/images/basil_camera-solid.png',
    'assets/images/fontisto_mobile.png',
    'assets/images/map_furniture-store.png',
    'assets/images/ri_motorbike-fill.png',
    'assets/images/solar_bell-bold.png',
  ];
  bool selected = false;
  void toggleTextFieldVisibility() {
    setState(() {
      selected = !selected;
    });
  }

  TextEditingController otherController = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();

    // Listen to changes in the text field and update the button visibility accordingly.
    otherController.addListener(() {
      setState(() {
        isTextFieldEmpty = otherController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List<Color> randomColorList = [];

    for (int i = 0; i < SellCategory.length; i++) {
      Color randomColor = myColors[random.nextInt(myColors.length)];
      randomColorList.add(randomColor);
    }
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomContainer(
              text: 'What are you offering?',
              iconVar: Icons.close,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                child: Text(
                  "Categories",
                  style: AppTextStyles.textStyleBoldBodyMedium,
                )),
            Column(
              children: [
                for (int i = 0; i < Selling.length; i++)
                  CustomCircleAvatarRow(
                    selected: false,
                    link: Selling[i],
                    col: randomColorList[i],
                    txt: SellCategory[i],
                    ontap: () {
                      push(
                          context,
                          SubCategorieScreen(
                            link: Selling[i],
                            color: randomColorList[i],
                            text: SellCategory[i],
                          ));
                    },
                  ),
                CustomCircleAvatarRow(
                    selected: selected,
                    link: 'assets/images/logo.png',
                    txt: 'Other',
                    col: AppColors.white,
                    ontap: () {
                      toggleTextFieldVisibility();
                    }),
                const SizedBox(
                  height: 10,
                ),
                if (selected)
                  CustomTextField(
                    width: size.width * .80,

                    // height: 30.00,
                    hintText: "Category",
                    // prfixicon: Icons.edit,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black),
                        borderRadius: BorderRadius.circular(20.0)),
                    controller: otherController,
                    obsecuretext: false,
                  ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: !isTextFieldEmpty,
                  child: CustomButton(
                    width: size.width * .30,
                    text: "Next",
                    onTap: () {
                      toggleTextFieldVisibility();
                      SellCategory.add(otherController.text);
                      Selling.add('assets/images/logo.png');
                      push(
                          context,
                          PostDetailScreen1(
                            subtext: "",
                            link: 'assets/images/logo.png',
                            color: Colors.white,
                            titletext: otherController.text,
                          ));
                    },
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
