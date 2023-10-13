import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final link, col, txt, ontap;
  CustomCircleAvatar(
      {required this.link, required this.col, required this.txt, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ontap == null
              ? CircleAvatar(
                  backgroundColor: col,
                  child: Image(
                    image: AssetImage(link),
                    height: 32,
                    width: 32,
                  ),
                  radius: 30,
                )
              : InkWell(
                  onTap: ontap,
                  child: CircleAvatar(
                    backgroundColor: col,
                    child: Image(
                      image: AssetImage(link),
                      height: 32,
                      width: 32,
                    ),
                    radius: 30,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              txt,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
