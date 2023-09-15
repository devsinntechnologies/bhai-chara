import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../provider/splash_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/container.dart';
import '../../utils/text-styles.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomContainer(
          text: 'Review your details',
          iconVar: Icons.close,
        ),
        Builder(builder: (context) {
          var provider = context.watch<SplashProvider>();

          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your name",
                          style: AppTextStyles.textStyleNormalBodyXSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 50,
                          child: TextFormField(
                              decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Type here",
                            hintStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          );
        })
      ]),
    );
  }
}
