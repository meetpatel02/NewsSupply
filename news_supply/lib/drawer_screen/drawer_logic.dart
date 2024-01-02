import 'package:get/get.dart';

import '../constant/constant.dart';
import 'drawer_state.dart';

class DrawerScreenLogic extends GetxController {
  final DrawerScreenState state = DrawerScreenState();

  void selectDestination(int index) {
      Constant.selectedTabIndex = index;
      update();
  }
}
