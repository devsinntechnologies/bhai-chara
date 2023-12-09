

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/provider/slider_provider.dart';
import '../../common/containers/container.dart';
import '../../utils/text-styles.dart';

class UserPreferencesScreen extends StatelessWidget {
  UserPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              text: 'User Preferences',
              iconVar: Icons.arrow_back_ios,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 35),
              child: Text(
                'Font size',
                style: AppTextStyles.textStyleBoldBodyMedium.copyWith(fontFamily: 'Roboto-Light'),
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.only(
                left: 20,right: 20
              ),
              child: Row(
               
                children: [
                  Text(
                    'A',
                    style: AppTextStyles.textStyleBoldBodySmall.copyWith(fontFamily: 'Roboto-Light'),
                  ),
                  Expanded(
                    child: Consumer<SliderProvider>(
                      builder: (context, sliderProvider, _) {
                        return Slider(
                          value: sliderProvider.fontSize,
                          min: 10.0,
                          max: 30.0,
                          onChanged: (value) {
                            sliderProvider.updateFontSize(value);
                          },
                        );
                      },
                    ),
                  ),
                  Text(
                    'A',
                    style: AppTextStyles.textStyleBoldBodyMedium.copyWith(fontFamily: 'Roboto-Light'),
                  ),
                ],
              ),
            ),
    
          
         
          ],
        ),
      ),
    );
  }
}
