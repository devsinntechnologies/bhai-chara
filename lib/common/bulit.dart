import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Builit {
  static var SelectedBulit = Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 8,
      width: 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.blue),
    ),
  );

  static var UnSelectBulit = Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.grey),
    ),
  );
}
