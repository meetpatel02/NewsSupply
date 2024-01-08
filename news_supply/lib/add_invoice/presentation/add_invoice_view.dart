// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_supply/utils/app_string.dart';
import 'package:news_supply/utils/color.dart';
import 'package:news_supply/widgets/custom_text_field.dart';
import 'package:news_supply/widgets/title_text_view.dart';
import 'package:news_supply/widgets/widget_helper.dart';

class AddInvoicePage extends StatelessWidget {
  const AddInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConst.containerBgColor,
          title: TitleTextView(
            AppString.addInvoice,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hSpace(20),
                  CustomTextField(
                    titleText: 'Invoice Number',
                    color: ColorConst.containerBgColor,
                    hintText: 'Invoice Number',
                    keyboardType: TextInputType.name,
                    nextField: TextInputAction.next,
                  ),
                  hSpace(20),
                  CustomTextField(
                    titleText: 'Invoice Date',
                    color: ColorConst.containerBgColor,
                    hintText: 'Invoice Date',
                    keyboardType: TextInputType.name,
                    nextField: TextInputAction.next,
                  ),
                  hSpace(20),
                  CustomTextField(
                    titleText: 'Invoice Due Date',
                    color: ColorConst.containerBgColor,
                    hintText: 'Invoice Due Date',
                    keyboardType: TextInputType.name,
                    nextField: TextInputAction.next,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
