import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

showSnack(context, text, {isSuccess = false}) {
  
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(text.toString()),
          backgroundColor: isSuccess ? AppColors.blue : AppColors.red,
        ));
}