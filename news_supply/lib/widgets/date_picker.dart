import 'package:flutter/material.dart';
import 'package:news_supply/widgets/title_text_view.dart';

import '../utils/color.dart';

class DateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final dynamic onTap;
  final String titleText;
  final Icon? suffixIcon;
  final bool? readOnly;

  const DateTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.titleText,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 5,
        bottom: 5,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConst.blue),
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextView(
            titleText,
            fontSize: 11,
            color: ColorConst.blue,
          ),
          TextField(
            onTap: onTap,
            readOnly: true,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: ColorConst.teal,
            // obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.today,
                color: ColorConst.themeColor,
                size: 24,
              ),
              contentPadding: const EdgeInsets.all(0.0),
              suffixIconConstraints: const BoxConstraints(maxHeight: 20),
              isDense: true,
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 14, color: ColorConst.appVersion,fontWeight: FontWeight.w400),
              border: InputBorder.none,
            ),
            minLines: 1,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
