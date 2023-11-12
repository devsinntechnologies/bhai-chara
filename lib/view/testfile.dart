import 'dart:io';
import 'package:bhai_chara/utils/custom_loader.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/post%20and%20detail/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/Image_Picker/compress_provider.dart';

// ignore: must_be_immutable
class TestScreen extends StatelessWidget {
  TestScreen({super.key, required this.images});
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    var pro = context.read<CompressProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        pro.compressImages(images);
        return Container(
          child: Column(
            children: [
              pro.isLoading
                  ? CustomLoader()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < pro.compressedImage.length; i++)
                            InkWell(
                              onTap: () async {
                                push(
                                    context,
                                    ImageScreen(
                                        imagePath: pro.compressedImage[i]));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 100,
                                width: 100,
                                child: Image.file(
                                  pro.compressedImage[i],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}

func() {}
