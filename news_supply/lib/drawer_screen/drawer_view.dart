// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../routes/route.dart';
import '../utils/app_string.dart';
import '../utils/color.dart';
import '../widgets/title_text_view.dart';
import '../widgets/widget_helper.dart';
import 'drawer_logic.dart';

class DrawerScreenPage extends StatelessWidget {
  DrawerScreenPage({Key? key}) : super(key: key);

  final logic = Get.find<DrawerScreenLogic>();
  final drawerLogic = Get.find<DrawerScreenLogic>();
  final state = Get.find<DrawerScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerScreenLogic>(
        init: logic,
        builder: (logic) {
      return Drawer(
        backgroundColor: ColorConst.bgColor,
        child: Column(
          children: [
            hSpace(40),
            SizedBox(
              height: 150,
              width: 150,
              child: Image(
                image: AssetImage('assets/images/newspaper_logo.png'),),
            ),
            ListTile(
              selected: Constant.selectedTabIndex == 0,
              selectedTileColor: ColorConst.containerBgColor,
              title:
              TitleTextView(
                AppString.dashBoard,
                color: Constant.selectedTabIndex == 0
                    ? Colors.black
                    : Colors.black,
              ),
              leading: Icon(
                Icons.dashboard,
                color: Constant.selectedTabIndex == 0
                    ? Colors.black
                    : Colors.black,
              ),
              onTap: () {
                // Get.back();
                logic.selectDestination(0);
                logic.update();
                Get.toNamed(RouteClass.dashBoard);
              },
            ),
            ListTile(
              selected: Constant.selectedTabIndex == 1,
              selectedTileColor: ColorConst.containerBgColor,
              title: TitleTextView(
                AppString.invoice,
                color: Constant.selectedTabIndex == 1
                    ? Colors.black
                    : Colors.black,
              ),
              leading: Icon(
                Icons.list,
                color: Constant.selectedTabIndex == 1
                    ? Colors.black
                    : Colors.black,
              ),
              onTap: () {
                // Get.back();
                logic.selectDestination(1);
                Get.toNamed(RouteClass.invoice);
                logic.update();
              },
            ),
            ListTile(
              selected: Constant.selectedTabIndex == 2,
              selectedTileColor: ColorConst.containerBgColor,
              title: TitleTextView(
                AppString.clients,
                color: Constant.selectedTabIndex == 2
                    ? Colors.black
                    : Colors.black,
              ),
              leading: Icon(
                Icons.people,
                color: Constant.selectedTabIndex == 2
                    ? Colors.black
                    : Colors.black,
              ),
              onTap: () {
                logic.selectDestination(2);
                Get.toNamed(RouteClass.client);
                logic.update();
              },
            ),
            ListTile(
              selected: Constant.selectedTabIndex == 3,
              selectedTileColor: ColorConst.containerBgColor,
              title: TitleTextView(
                AppString.payments,
                color: Constant.selectedTabIndex == 3
                    ? Colors.black
                    : Colors.black,
              ),
              leading: Icon(
                Icons.account_balance,
                color: Constant.selectedTabIndex == 3
                    ? Colors.black
                    : Colors.black,
              ),
              onTap: () {
                logic.selectDestination(3);
                logic.update();
              },
            ),
            ListTile(
              selected: Constant.selectedTabIndex == 4,
              selectedTileColor: ColorConst.containerBgColor,
              title: TitleTextView(
                AppString.account,
                color: Constant.selectedTabIndex == 4
                    ? Colors.black
                    : Colors.black,
              ),
              leading: Icon(
                Icons.account_circle,
                color: Constant.selectedTabIndex == 4
                    ? Colors.black
                    : Colors.black,
              ),
              onTap: () {
                logic.selectDestination(4);
                logic.update();
              },
            ),
          ],
        ),
      );
    });
  }
}
