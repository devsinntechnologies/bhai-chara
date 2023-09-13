import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/app_colors.dart';
import '../../utils/container.dart';
import '../../utils/text-styles.dart';

class UserPreferencesScreen extends StatefulWidget {
  UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  double _fontSize = 16.0;

  // Function to update font size
  void _updateFontSize(double value) {
    setState(() {
      _fontSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            text: 'User Preferences',
            iconVar: Icons.arrow_back_ios,
          ),
          Text(
            'Font size',
            style: AppTextStyles.textStyleBoldBodyMedium,
          ),
          Slider(
            value: _fontSize,
            min: 10.0,
            max: 30.0,
            onChanged: _updateFontSize,
          ),
        ],
      ),
    );
  }
}
