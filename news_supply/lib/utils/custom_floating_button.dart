import 'package:flutter/material.dart';
import '../widgets/title_text_view.dart';
import 'color.dart';

Widget customFloatingButton(dynamic onPress, String title) {
  return SizedBox(
    height: 50,
    child: FloatingActionButton.extended(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: ColorConst.themeColor,
        onPressed: onPress,
        label: Row(
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
            TitleTextView(
              title,
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )
          ],
        )),
  );
}
