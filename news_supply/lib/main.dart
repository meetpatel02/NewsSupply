import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteClass.signUp,
      getPages: RouteClass.routes,
    );
  }
}
