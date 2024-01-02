import 'package:flutter/cupertino.dart';
import 'package:news_supply/widgets/title_text_view.dart';

import '../utils/color.dart';

Widget smallText(String title) {
  return TitleTextView(
    title,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorConst.appVersion,
  );
}

Widget mediumText(String title) {
  return TitleTextView(
    title,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}