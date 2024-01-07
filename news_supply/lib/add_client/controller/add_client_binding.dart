import 'package:get/get.dart';

import 'add_client_logic.dart';

class AddClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddClientLogic());
  }
}
