// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/widgets/title_text_view.dart';

import '../utils/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? nextField;
  final String titleText;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final bool? readOnlyText;
  final Color color;
  final Widget? icon;
  final dynamic onChanged;
  final dynamic onEdit;
  final dynamic onSubmit;
  final dynamic inputFormatters;
  final dynamic textCapitalization;

  const CustomTextField(
      {Key? key,
      required this.titleText,
      required this.color,
      required this.hintText,
      this.controller,
      required this.keyboardType,
      required this.nextField,
      this.labelText,
      this.icon,
      this.obscureText,
      this.readOnlyText,
      this.onChanged,
      this.onEdit,
      this.onSubmit,
      this.inputFormatters,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width - 40,
      padding: const EdgeInsets.only(
        left: 25,
        top: 6,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextView(
            titleText,
            fontSize: 11,
            color: Colors.black,
          ),
          TextField(
            textInputAction: nextField,
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: color,
            obscureText: obscureText ?? false,
            readOnly: readOnlyText ?? false,
            onChanged: onChanged,
            onEditingComplete: onEdit,
            onSubmitted: onSubmit,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            inputFormatters: inputFormatters ?? [],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0.0),
              isDense: true,
              hintText: hintText,
              suffixIcon: icon,
              hintStyle: TextStyle(
                  fontSize: 15,
                  color: ColorConst.appVersion,
                  fontWeight: FontWeight.w400),
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

class CustomPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? nextField;
  final String titleText;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final Color color;
  final Widget? icon;

  const CustomPasswordTextField({
    super.key,
    required this.titleText,
    required this.color,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.nextField,
    this.labelText,
    this.icon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width - 60,
      padding: EdgeInsets.only(
        left: 25,
        top: 7,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextView(
                  titleText,
                  fontSize: 11,
                  color: color,
                ),
                TextField(
                  textInputAction: nextField,
                  keyboardType: keyboardType,
                  controller: controller,
                  cursorColor: color,
                  obscuringCharacter: '*',
                  obscureText: obscureText ?? false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    hintText: hintText,
                    hintStyle:
                        TextStyle(fontSize: 15, color: ColorConst.appVersion),
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: icon,
          ),
        ],
      ),
    );
  }
}
