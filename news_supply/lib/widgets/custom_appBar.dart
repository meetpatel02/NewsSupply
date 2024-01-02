// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_supply/widgets/title_text_view.dart';
import '../utils/color.dart';

AppBar customAppBar(String title, dynamic leading, dynamic action) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: TitleTextView(
      title,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
    backgroundColor: ColorConst.themeColor,
    leading: leading,
    actions: action,
  );
}
