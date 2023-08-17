import 'package:flutter/material.dart';
import 'package:opticash_test/ui/theme/theme.dart';

class ShowMessage {
  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1600),
      backgroundColor: AppColors.darkGreenColor2,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 19,
          ),
        ),
      ),
    ));
  }
}
