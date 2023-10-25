// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';

import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/common/custom_container_children.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/provider/authentication_provider/auth_provider.dart';
import 'package:bhai_chara/provider/firebase/addImages.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/post%20and%20detail/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../utils/container.dart';
import '../home-screens/root_screen.dart';

class PostDetailScreen1 extends StatefulWidget {
  PostDetailScreen1(
      {super.key, this.subtext, this.titletext, this.color, this.link});
  var subtext, titletext, color, link;
  @override
  State<PostDetailScreen1> createState() => _PostDetailScreen1State();
}

class _PostDetailScreen1State extends State<PostDetailScreen1> {
  TextEditingController priceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController titlleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  List<File> selectedImages = [];
  List<String> urlImage = [];
  ImagePicker picker = ImagePicker();
  var selected = "";
  var pricing = "Free";
  var loc;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CustomContainer(
                  text: "Include some details",
                  iconVar: Icons.arrow_back_ios,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "UPLOAD UP TO 10 PHOTOS",
                            style: AppTextStyles.textStyleBoldBodySmall,
                          ),
                          const Spacer(),
                          selectedImages.isNotEmpty &&
                                  selectedImages.length <= 9
                              ? InkWell(
                                  onTap: () {
                                    getImages();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.blue),
                                    child: const Center(
                                      child: Icon(
                                        Icons.photo_camera,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(""),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      selectedImages.isEmpty
                          ? InkWell(
                              onTap: () async {
                                getImages();
                              },
                              child: Container(
                                  height: 180.0,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.blue),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_camera,
                                            color: AppColors.primary,
                                            size: 50,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [],
                                      )
                                    ],
                                  )),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (int i = 0;
                                      i < selectedImages.length;
                                      i++)
                                    InkWell(
                                      onTap: () {
                                        push(
                                            context,
                                            ImageScreen(
                                                imagePath: selectedImages[i]));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 100,
                                        width: 100,
                                        child: Image.file(
                                          selectedImages[i],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Category",
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      widget.link != null
                          ? CustomListTile(
                              tap: () {
                                push(context, RootScreen());
                              },
                              back_color: widget.color,
                              circular_radius: 30.0,
                              circularwidget: Container(
                                  height: 65.0,
                                  width: 65.0,
                                  child: Center(
                                      child: Image(
                                    image: AssetImage(widget.link),
                                    fit: BoxFit.cover,
                                  ))),
                              titletext: widget.titletext,
                              titleStyle: AppTextStyles.textStyleBoldBodyMedium,
                              subtitleText: widget.subtext,
                              subtitleStyle:
                                  AppTextStyles.textStyleSubtitleBody)
                          : Text("Null"),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Price",
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              pricing = "Free";
                              setState(() {});
                            },
                            child: CustomContainerText(
                              style: pricing == "Free"
                                  ? AppTextStyles.textStyleNormalBodySmall
                                      .copyWith(color: AppColors.white)
                                  : null,
                              container_color:
                                  pricing == "Free" ? AppColors.blue : null,
                              text: "Free",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              pricing = "Price";
                              setState(() {});
                            },
                            child: CustomContainerText(
                              style: pricing == "Price"
                                  ? AppTextStyles.textStyleNormalBodySmall
                                      .copyWith(color: AppColors.white)
                                  : null,
                              container_color:
                                  pricing == "Price" ? AppColors.blue : null,
                              text: "Price",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (pricing == "Price")
                        CustomTextField(
                          keyboardtype: TextInputType.number,
                          controller: priceController,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: AppColors.grey)),
                          hintText: "Price",
                          obsecuretext: false,
                          width: size.width,
                        ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "Gender",
                      //   style: AppTextStyles.textStyleBoldBodySmall,
                      // ),
                      // const SizedBox(
                      //   height: 05,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         selected = "first";
                      //         setState(() {});
                      //       },
                      //       child: CustomContainerText(
                      //         style: selected == "first"
                      //             ? AppTextStyles.textStyleNormalBodySmall
                      //                 .copyWith(color: AppColors.white)
                      //             : null,
                      //         container_color:
                      //             selected == "first" ? AppColors.blue : null,
                      //         text: "Male",
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         selected = "second";
                      //         setState(() {});
                      //       },
                      //       child: CustomContainerText(
                      //         style: selected == "second"
                      //             ? AppTextStyles.textStyleNormalBodySmall
                      //                 .copyWith(color: AppColors.white)
                      //             : null,
                      //         container_color:
                      //             selected == "second" ? AppColors.blue : null,
                      //         text: "Female",
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const Divider(),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   "Age",
                      //   style: AppTextStyles.textStyleBoldBodySmall,
                      // ),
                      // const SizedBox(
                      //   height: 05,
                      // ),
                      // CustomTextField(
                      //   keyboardtype: TextInputType.number,
                      //   controller: ageController,
                      //   border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: BorderSide(color: AppColors.grey)),
                      //   hintText: "Years 1 - 2",
                      //   obsecuretext: false,
                      //   width: size.width,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const Divider(),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      GestureDetector(
                        onTap: () async {},
                        child: Builder(builder: (context) {
                          var pro = context.read<AuthProvider>();
                          return CutomListTileUser(
                            title_text: "Location",
                            title_style: AppTextStyles.textStyleTitleBodySmall,
                            subtitle_text: pro.currentAddress != null
                                ? pro.currentAddress
                                : "Choose",
                            subtitle_style: AppTextStyles.textStyleSubtitleBody,
                            trailing_widget: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xfa000000),
                              size: 20,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Add title*",
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      CustomTextField(
                        keyboardtype: TextInputType.text,
                        controller: titlleController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.grey)),
                        hintText: "Title",
                        obsecuretext: false,
                        width: size.width,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Describe what you are selling*",
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      CustomTextField(
                        keyboardtype: TextInputType.multiline,
                        controller: describeController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.grey)),
                        hintText: "Selling",
                        obsecuretext: false,
                        width: size.width,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (titlleController.text.isEmpty) {
                            showSnack(
                                context: context,
                                text: "Enter Please Title Field");
                          } else if (describeController.text.isEmpty) {
                            showSnack(
                                context: context,
                                text: "Enter Please Description Field");
                          } else if (pricing == "Price" &&
                              priceController.text.isEmpty) {
                            priceController.text = "Free";
                          } else if (pricing == "Free") {
                            priceController.text = "Free";
                          } else if (pricing != "Free" &&
                              priceController.text.isEmpty) {
                            showSnack(
                                context: context,
                                text: "Please Enter Price Field");
                          } else {
                            if (selectedImages.isNotEmpty) {
                              var data = context.read<FireStoreProvider>();
                              data.addImage(
                                selectedImages,
                                price: priceController.text,
                                age: ageController.text,
                                title: titlleController.text,
                                description: describeController.text,
                                category: widget.titletext,
                                subcategory: widget.subtext,
                              );
                            }

                            FocusScope.of(context).nextFocus();
                            // uploadImage(selectedImages);
                            push(context, RootScreen());
                          }
                        },
                        text: "Post Now",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
