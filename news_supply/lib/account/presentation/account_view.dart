import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/account_logic.dart';


class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final logic = Get.find<AccountLogic>();
  final state = Get.find<AccountLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
