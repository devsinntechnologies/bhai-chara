import 'dart:io';

import 'package:bhai_chara/provider/Image_Picker/compress_provider.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/post%20and%20detail/ImagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  TestScreen({super.key, required this.images});
  List<File> images = [];

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  func() {
    if (widget.images != null) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < widget.images.length; i++)
                      InkWell(
                        onTap: () async {
                          push(context,
                              ImageScreen(imagePath: widget.images[i]));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 100,
                          width: 100,
                          child: Image.file(
                            widget.images[i],
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
