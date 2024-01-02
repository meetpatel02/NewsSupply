import 'package:get/get.dart';

import '../../drawer_screen/drawer_logic.dart';
import 'invoice_logic.dart';


class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoiceLogic());
    Get.lazyPut(() => DrawerScreenLogic());

  }
}
