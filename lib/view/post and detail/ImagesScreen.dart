import 'package:bhai_chara/utils/container.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomContainer(
              text: "Image",
              iconVar: Icons.arrow_back_ios,
            ),
            Container(
                height: size.height * .80,
                width: size.width,
                child: Image(
                  image: AssetImage("assets/images/Rectangle 17.png"),
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
