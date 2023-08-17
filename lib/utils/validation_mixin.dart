import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  static String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field is required' : null;

  static String? validateDropdown(bool value) =>
      value == false ? 'field is required' : null;

  static String? validateEmailAddress(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailValid ? 'Enter a valid Email Address' : null;
  }
}
