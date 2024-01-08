// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/utils/color.dart';
import 'package:news_supply/widgets/custom_button.dart';
import 'package:news_supply/widgets/custom_text_field.dart';
import 'package:news_supply/widgets/title_text_view.dart';
import 'package:news_supply/widgets/widget_helper.dart';
import '../controller/sign_up_logic.dart';
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final logic = Get.find<SignUpLogic>();
  final state = Get.find<SignUpLogic>().state;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConst.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/news-logo.png')),
                hSpace(40),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        hSpace(20),
                        CustomTextField(
                          titleText: 'Enter Email',
                            color: ColorConst.containerBgColor,
                            hintText: 'Enter your email address',
                            keyboardType: TextInputType.emailAddress,
                            nextField: TextInputAction.next,
                        ),
                        hSpace(20),
                        CustomTextField(
                          titleText: 'Enter Password',
                          color: ColorConst.containerBgColor,
                          hintText: '******',
                          keyboardType: TextInputType.emailAddress,
                          nextField: TextInputAction.next,
                        ),
                        hSpace(30),
                        SizedBox(
                          height: 50,
                          width: Get.width,
                          child: CustomButton(
                              text: 'Login',
                              borderColor: Colors.transparent,
                              textColor: Colors.black,
                              bgColor: ColorConst.containerBgColor,
                              onTap: (){},
                          ),
                        ),
                        hSpace(10),

                      ],
                    ),
                  ),
                ),
                TitleTextView('App Version')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
