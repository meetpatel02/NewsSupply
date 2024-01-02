import 'package:get/get.dart';

import 'drawer_logic.dart';

class DrawerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerScreenLogic());
  }
}
