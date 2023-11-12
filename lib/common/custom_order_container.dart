import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class OrderContainer extends StatelessWidget {
  OrderContainer(
      {super.key,
      required this.text,
      required this.color1,
      required this.color2,
      required this.time,
      required this.price});
  var text, color1, color2, time, price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: AppTextStyles.textStyleBoldBodySmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                price,
                style: AppTextStyles.textStyleBoldBodyXSmall,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                time,
                style: AppTextStyles.textStyleBoldBodyXSmall,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 8,
                  ),
                  Text("street no.7,house no.23,samnabde lahore"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Decline",
                     // textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodySmall.copyWith(color: AppColors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), color: color1),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Accept",
                     // textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleNormalBodySmall.copyWith(color: AppColors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), color: color2),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
