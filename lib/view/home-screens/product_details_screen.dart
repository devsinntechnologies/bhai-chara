import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/text-styles.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 300,
                child: Image(
                  image: AssetImage('assets/images/Rectangle 16.png'),
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.White,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.forward,
                          color: AppColors.White,
                        ))
                  ],
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Text('Rs 40,000', style: AppTextStyles.textStyleBoldBodyMedium,),
            ),

          ],
        ),
      ),
    );
  }
}
