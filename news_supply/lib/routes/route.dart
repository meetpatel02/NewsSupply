import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/controller/dashBoard_binding.dart';
import '../dashboard/presentation/dashBoard_view.dart';
import '../drawer_screen/drawer_binding.dart';
import '../drawer_screen/drawer_view.dart';
import '../home/binding.dart';
import '../home/view.dart';
import '../invoice/controller/invoice_binding.dart';
import '../invoice/presentation/invoice_view.dart';


class RouteClass {
  static String splash = '/';
  static String dashBoard = '/dashBoard';
  static String invoice = '/invoice';
  static String home = '/home';
  static String drawer = '/drawer';

  static List<GetPage> routes = [
    GetPage(
      name: drawer,
      page: () => DrawerScreenPage(),
      binding: DrawerScreenBinding(),
    ),
    GetPage(
      name: dashBoard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: invoice,
      page: () => InvoicePage(),
      binding: InvoiceBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
  ];
}
