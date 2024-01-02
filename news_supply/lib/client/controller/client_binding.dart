import 'package:get/get.dart';
import 'client_logic.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientLogic());
  }
}
