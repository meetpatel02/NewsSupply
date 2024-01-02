import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../drawer_screen/drawer_view.dart';
import '../../utils/app_string.dart';
import '../../utils/color.dart';
import '../../widgets/title_text_view.dart';
import '../controller/dashBoard_logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();
  final state = Get.find<DashboardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.containerBgColor,
        title: TitleTextView(AppString.dashBoard),
      ),
      drawer: DrawerScreenPage(),
    );
  }
}
