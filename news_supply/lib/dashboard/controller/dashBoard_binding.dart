import 'package:get/get.dart';

import '../../drawer_screen/drawer_logic.dart';
import 'dashBoard_logic.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardLogic());
    Get.lazyPut(() => DrawerScreenLogic());
  }
}
