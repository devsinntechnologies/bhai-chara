import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/material.dart';
import '../common/containers/custom_order_container.dart';
import '../utils/app_colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.blue,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Center(
                  child: Text(
                    "2 new notifications",
                    //textAlign: TextAlign.center,
                    style: AppTextStyles.textStyleNormalBodyMedium_whiteColor,
                  ),
                ),
                OrderContainer(
                    text: "Kashaf Waheed",
                    color1: AppColors.grey,
                    color2: AppColors.blue,
                    price: "price:\t\t\t3400",
                    time: "time:\t\t\t\t24 min ago"),
                OrderContainer(
                    text: "Farzana waheed",
                    color1: AppColors.grey,
                    color2: AppColors.blue,
                    price: "price:\t\t\t5600",
                    time: "time:\t\t\t\t1 h ago"),
              ],
            ),
          )),
    );
  }
}
