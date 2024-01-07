import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/add_client/controller/add_client_binding.dart';
import 'package:news_supply/add_client/presentation/add_client_view.dart';
import 'package:news_supply/client/controller/client_binding.dart';
import 'package:news_supply/client/presentation/client_view.dart';
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
  static String client = '/client';
  static String home = '/home';
  static String drawer = '/drawer';
  static String addClient = '/addClient';

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
      name: client,
      page: () => ClientPage(),
      binding: ClientBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: addClient,
      page: () => AddClientPage(),
      binding: AddClientBinding(),
      transition: Transition.fade,
    ),
  ];
}
