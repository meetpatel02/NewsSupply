import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../drawer_screen/drawer_view.dart';
import '../../utils/app_string.dart';
import '../../utils/color.dart';
import '../../widgets/title_text_view.dart';
import '../controller/invoice_logic.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key}) : super(key: key);

  final logic = Get.find<InvoiceLogic>();
  final state = Get.find<InvoiceLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.textColor,
      appBar: AppBar(
        backgroundColor: ColorConst.containerBgColor,
        title: TitleTextView(AppString.invoice),
      ),
      drawer: DrawerScreenPage(),
    );
  }
}
