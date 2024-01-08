// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_supply/routes/route.dart';
import 'package:news_supply/widgets/widget_helper.dart';
import '../../drawer_screen/drawer_view.dart';
import '../../utils/app_string.dart';
import '../../utils/color.dart';
import '../../widgets/title_text_view.dart';
import '../controller/client_logic.dart';

class ClientPage extends StatelessWidget {
  ClientPage({Key? key}) : super(key: key);

  final logic = Get.find<ClientLogic>();
  final state = Get.find<ClientLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.containerBgColor,
        title: TitleTextView(
          AppString.clients,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      drawer: DrawerScreenPage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: CupertinoSearchTextField(),
              ),
              hSpace(20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.yellow),
                          ),
                          wSpace(10),
                          TitleTextView(
                            'Client Name',
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorConst.containerBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Get.toNamed(RouteClass.addClient);
        },
        label: TitleTextView("Add Client"),
      ),
    );
  }
}
