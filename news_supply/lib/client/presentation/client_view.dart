import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/client_logic.dart';

class ClientPage extends StatelessWidget {
  ClientPage({Key? key}) : super(key: key);

  final logic = Get.find<ClientLogic>();
  final state = Get.find<ClientLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
