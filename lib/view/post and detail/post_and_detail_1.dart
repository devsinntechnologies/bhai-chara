import 'dart:io';

import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/common/custom_container_children.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/common/custom_list_tile.dart';
import 'package:bhai_chara/provider/firebase/addproduct.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/post%20and%20detail/ImagesScreen.dart';
import 'package:bhai_chara/view/review_details_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../utils/container.dart';

class PostDetailScreen1 extends StatefulWidget {
  const PostDetailScreen1({super.key});

  @override
  State<PostDetailScreen1> createState() => _PostDetailScreen1State();
}

class _PostDetailScreen1State extends State<PostDetailScreen1> {
  TextEditingController priceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController titlleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  List<File> selectedImages = [];
  ImagePicker picker = ImagePicker();
  var selected = "";

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
                            "UPLOAD UP TO 20 PHOTOS",
                            style: AppTextStyles.textStyleBoldBodySmall,
                          ),
                          const Spacer(),
                          selectedImages.isNotEmpty &&
                                  selectedImages.length <= 20
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
                      // ignore: unnecessary_null_comparison
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
                                  child: Column(
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
                                        height: 150,
                                        width: 120,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Image.file(
                                                selectedImages[i],
                                                fit: BoxFit.cover,
                                              ),
                                            ]),
                                      ),
                                    ),
                                ],
                              ),
                            ),
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
                          tap: () {},
                          back_color: AppColors.orangeColor,
                          circular_radius: 34.0,
                          circularwidget: Container(
                              height: 30.0,
                              width: 30.0,
                              child: const Center(
                                  child: Image(
                                image:
                                    AssetImage("assets/images/cat_avatar.png"),
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
                        keyboardtype: TextInputType.number,
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
                        "Gender",
                        style: AppTextStyles.textStyleBoldBodySmall,
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              selected = "first";
                              setState(() {});
                            },
                            child: CustomContainerText(
                              style: selected == "first"
                                  ? AppTextStyles.textStyleNormalBodySmall
                                      .copyWith(color: AppColors.white)
                                  : null,
                              container_color:
                                  selected == "first" ? AppColors.blue : null,
                              text: "Male",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              selected = "second";
                              setState(() {});
                            },
                            child: CustomContainerText(
                              style: selected == "second"
                                  ? AppTextStyles.textStyleNormalBodySmall
                                      .copyWith(color: AppColors.white)
                                  : null,
                              container_color:
                                  selected == "second" ? AppColors.blue : null,
                              text: "Female",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              selected = "third";
                              setState(() {});
                            },
                            child: CustomContainerText(
                              style: selected == "third"
                                  ? AppTextStyles.textStyleNormalBodySmall
                                      .copyWith(color: AppColors.white)
                                  : null,
                              container_color:
                                  selected == "third" ? AppColors.blue : null,
                              text: "Pair",
                            ),
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
                        keyboardtype: TextInputType.number,
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
                          if (priceController.text.isEmpty) {
                            showSnack(context: context);
                          } else if (ageController.text.isEmpty) {
                            showSnack(context: context);
                          } else if (titlleController.text.isEmpty) {
                            showSnack(context: context);
                          } else if (describeController.text.isEmpty) {
                            showSnack(context: context);
                          } else {
                            var product = context.read<ProductProvider>();
                            product.addProduct(
                                priceController.text,
                                ageController.text,
                                titlleController.text,
                                describeController.text);

                            FocusScope.of(context).nextFocus();

                            push(context, PostDetailScreen2());
                          }
                        },
                        text: "Next",
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

  uploadImage() async {
    // ignore: unused_local_variable
    String imageUrl;
    final _firebaseStorage = FirebaseStorage.instance;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      var images = await getImages();
      var file = File(images.path);

      if (images != null) {
        //Upload to Firebase
        var snapshot = await _firebaseStorage
            .ref()
            .child('images/imageName')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}
