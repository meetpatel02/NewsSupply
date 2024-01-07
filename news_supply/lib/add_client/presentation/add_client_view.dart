// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/add_client/controller/add_client_logic.dart';
import '../../../utils/app_string.dart';
import '../../../utils/color.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/title_text_view.dart';
import '../../widgets/custom_appBar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/widget_helper.dart';

class AddClientPage extends StatelessWidget {
  AddClientPage({Key? key}) : super(key: key);

  final logic = Get.find<AddClientLogic>();
  final state = Get.find<AddClientLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: customAppBar(
          AppString.addClient,
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          null),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GetBuilder(
          init: logic,
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  hSpace(15),
                  Row(
                    children: [
                      wSpace(10),
                      TitleTextView(
                        AppString.bi,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.appVersion,
                      ),
                      const Flexible(
                          child: Divider(
                        indent: 10,
                        endIndent: 20,
                      ))
                    ],
                  ),
                  hSpace(15),

                  ///Name TextField
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.cn,
                      hintText: AppString.enterName,
                      controller: state.nameController,
                      keyboardType: TextInputType.name,
                      nextField: TextInputAction.next),
                  hSpace(15),

                  ///Email TextField
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.ea,
                      hintText: AppString.enterEmail,
                      controller: state.emailController,
                      keyboardType: TextInputType.emailAddress,
                      nextField: TextInputAction.next),
                  hSpace(15),

                  ///phone TextField
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.pn,
                      hintText: AppString.enterPhone,
                      controller: state.phoneController,
                      keyboardType: TextInputType.phone,
                      nextField: TextInputAction.next),
                  hSpace(15),

                  ///Address TextField
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.address,
                      hintText: AppString.enterAdd,
                      controller: state.addressController,
                      keyboardType: TextInputType.name,
                      nextField: TextInputAction.next),
                  hSpace(15),

                  ///City TextField
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.city,
                      hintText: AppString.enterCity,
                      controller: state.cityController,
                      keyboardType: TextInputType.name,
                      nextField: TextInputAction.next),
                  hSpace(15),

                  ///ZIP code
                  CustomTextField(
                      color: ColorConst.containerBgColor,
                      titleText: AppString.zc,
                      hintText: AppString.enterZipCode,
                      controller: state.zipController,
                      keyboardType: TextInputType.text,
                      nextField: TextInputAction.next),

                  hSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///Cancel Button
                      CustomButton(
                          height: 40,
                          width: 150,
                          text: AppString.can,
                          borderColor: ColorConst.containerBgColor,
                          textColor: ColorConst.grey,
                          bgColor: Colors.white,
                          onTap: () {
                            Get.back();
                          }),

                      ///Save Client Button
                      CustomButton(
                        width: 150,
                        height: 40,
                        onTap: () {
                          logic.handleButtonTap();
                        },
                        text: AppString.saveClient,
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                        bgColor: ColorConst.containerBgColor,
                      ),
                    ],
                  ),
                  hSpace(20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
