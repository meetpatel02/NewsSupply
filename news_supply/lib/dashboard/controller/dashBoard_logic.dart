import 'package:get/get.dart';

import '../../constant/constant.dart';
import 'dashBoard_state.dart';


class DashboardLogic extends GetxController {
  final DashboardState state = DashboardState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Constant.selectedTabIndex = 0;
  }
}
