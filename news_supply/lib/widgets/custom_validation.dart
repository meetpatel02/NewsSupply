import 'package:flutter/material.dart';

import '../utils/custom_snackbar.dart';
import '../utils/error.dart';

class CustomValidation {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyEmailValidation,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    }
    return null;
  }
}
