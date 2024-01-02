import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payment_logic.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);

  final logic = Get.find<PaymentLogic>();
  final state = Get.find<PaymentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
