import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

SnackbarController snackBarView(
    String title, String mMessage, Icon icon, Color bgColor, Color textColor) {
  return Get.snackbar(title, mMessage,
      animationDuration: 500.milliseconds,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      icon: icon,
      backgroundColor: bgColor,
      colorText: textColor);
}
