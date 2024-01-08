import 'package:get/get.dart';
import 'package:news_supply/add_invoice/controller/add_invoice_logic.dart';

class AddInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddInvoiceLogic());
  }
}
