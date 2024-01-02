// ignore_for_file: must_be_immutable, file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:news_supply/widgets/title_text_view.dart';
import '../utils/color.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final String? value1;
  final String hint;
  dynamic onChanged;
  final String title;
  final List dropdownItems;

  CustomDropdown({
    Key? key,
    required this.value,
    this.value1,
    required this.dropdownItems,
    required this.hint,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: ColorConst.themeColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 3),
            child: TitleTextView(
              title,
              color: ColorConst.themeColor,
            ),
          ),
          DropdownButtonFormField2(
            isExpanded: true,
            isDense: true,
            value: value1,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                constraints: BoxConstraints(minHeight: 0, maxHeight: 40)),
            hint: Row(
              children: [
                Text(
                  hint,
                  style: const TextStyle(
                      fontSize: 15, color: ColorConst.appVersion),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: ColorConst.themeColor,
                )
              ],
            ),
            iconStyleData: const IconStyleData(iconSize: 0),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
            ),
            items: dropdownItems
                .map((value) =>
                DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
