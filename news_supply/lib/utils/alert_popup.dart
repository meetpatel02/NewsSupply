// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/title_text_view.dart';
import '../widgets/widget_helper.dart';
import 'color.dart';

void deletePopUp(BuildContext context) {
  Get.generalDialog(
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: animation,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: ColorConst.white,
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(0),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          content: Container(
            width: Get.width - 40,
            height: 340,
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: TitleTextView(
                      'Please confirm your action for',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TitleTextView(
                    'INV-SI-2023-24-001',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 40,
                    width: 285,
                    decoration: BoxDecoration(
                        color: ColorConst.divider,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: ColorConst.red, width: 2)),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.cancel,
                            color: ColorConst.red,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TitleTextView(
                            'CANCEL INVOICE',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 285,
                    decoration: BoxDecoration(
                      color: ColorConst.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TitleTextView(
                            'DELETE INVOICE',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: ColorConst.teal)),
                      child: Center(
                        child: TitleTextView(
                          'GO BACK',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.teal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 150),
    barrierDismissible: false,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Container();
    },
  );
}

Future deleteClient(BuildContext context, String name, String btn1, String btn2,
    dynamic onTap) {
  return
  Get.generalDialog(
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: animation,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: ColorConst.white,
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(0),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          content: Container(
            width: Get.width - 40,
            height: 300,
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: TitleTextView(
                      'Please confirm your action for',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TitleTextView(
                    name.toString(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onTap,
                    child: Container(
                      height: 40,
                      width: 285,
                      decoration: BoxDecoration(
                        color: ColorConst.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TitleTextView(
                              btn2,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: ColorConst.teal)),
                      child: Center(
                        child: TitleTextView(
                          'GO BACK',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.teal,
                        ),
                      ),
                    ),
                  ),
                 hSpace(50)
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 150),
    barrierDismissible: false,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Container();
    },
  );
}



