import 'package:bhai_chara/common/custom_appbar.dart';
import 'package:bhai_chara/common/custom_container_children.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/common/custom_text.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PostDetailScreen1 extends StatefulWidget {
  const PostDetailScreen1({super.key});

  @override
  State<PostDetailScreen1> createState() => _PostDetailScreen1State();
}

class _PostDetailScreen1State extends State<PostDetailScreen1> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  void selectedImages() async {
    final List<XFile>? selectedImages =
        await imagePicker.pickMultiImage(maxHeight: 100, maxWidth: 100);
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }
  // final ImagePicker _picker = ImagePicker();
  // void ImageSelect() async {
  //   final XFile? selectedImage = await _picker.pickImage(
  //       source: ImageSource.gallery, maxHeight: 100, maxWidth: 100);
  // }

  TextEditingController priceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController titlleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  @override
  void initState() {
    selectedImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBar(
            leading_widget: Icon(
              Icons.close,
              size: 30,
              color: AppColors.primary,
            ),
            title_text: "Include some details",
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: (() {
                  selectedImages();
                }),
                child: Text(
                  "UPLOAD UP TO 20 PHOTOS",
                  style: AppTextStyles.textStyleBoldBodySmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: unnecessary_null_comparison
              imageFileList.isNotEmpty
                  ? SizedBox(
                      height: 180,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageFileList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 150, // Set the desired width
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Image.file(
                              File(imageFileList[index].path),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      height: 180,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.blue),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_camera,
                                color: AppColors.primary,
                                size: 50,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Add images",
                                fontsize: 16,
                                fontweight: FontWeight.normal,
                                color: AppColors.primary,
                              ),
                            ],
                          )
                        ],
                      )),
              // : Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // : ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: imageFileList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Image.file(
              //         File(imageFileList[index].path),
              //         fit: BoxFit.cover,
              //       );
              //     },
              //   ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Category*",
                style: AppTextStyles.textStyleBoldBodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomListTile(
                  back_color: AppColors.orangeColor,
                  circular_radius: 34,
                  circularwidget: Container(
                      height: 30,
                      width: 30,
                      child: const Center(
                          child: Image(
                        image: AssetImage("assets/images/cat_avatar.png"),
                        fit: BoxFit.contain,
                      ))),
                  titletext: "Animal",
                  titleStyle: AppTextStyles.textStyleBoldBodyMedium,
                  subtitleText: "Dogs",
                  subtitleStyle: AppTextStyles.textStyleSubtitleBody),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price*",
                style: AppTextStyles.textStyleBoldBodySmall,
              ),
              const SizedBox(
                height: 05,
              ),
              CustomTextField(
                controller: priceController,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.grey)),
                hintText: "Price",
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
              CutomListTileUser(
                title_text: "Breed*",
                title_style: AppTextStyles.textStyleTitleBodySmall,
                subtitle_text: "None",
                subtitle_style: AppTextStyles.textStyleSubtitleBody,
                trailing_widget: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xfa000000),
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Sex",
                style: AppTextStyles.textStyleBoldBodySmall,
              ),
              const SizedBox(
                height: 05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomContainerText(
                    text: "Male",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomContainerText(
                    text: "Female",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomContainerText(
                    text: "Pair",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Age",
                style: AppTextStyles.textStyleBoldBodySmall,
              ),
              const SizedBox(
                height: 05,
              ),
              CustomTextField(
                controller: ageController,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.grey)),
                hintText: "Age",
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
              CutomListTileUser(
                title_text: "Location*",
                title_style: AppTextStyles.textStyleTitleBodySmall,
                subtitle_text: "Choose",
                subtitle_style: AppTextStyles.textStyleSubtitleBody,
                trailing_widget: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xfa000000),
                  size: 20,
                ),
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
                height: 20,
              ),
              InkWell(
                onTap: () {
                  //fuctionality
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.blue),
                    child: Center(
                      child: Text(
                        "Next",
                        style:
                            AppTextStyles.textStyleNormalBodySmall_WhiteColor,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
