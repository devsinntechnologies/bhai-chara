import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';

import '../utils/custom_loader.dart';

class TestFile extends StatefulWidget {
  const TestFile({super.key});

  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CustomLoader(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Wait for Verification OTP"),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Never tab Back"),
                      ],
                    ),
                    actions: <Widget>[CustomLoader()],
                  ),
                );
                showSnack(context: context, text: "Hi Dialogue Box");
              },
              // onPressed: showLoaderDialog(context),
              child: Icon(
                Icons.favorite,
                size: 30,
              ))),
    );
  }
}
