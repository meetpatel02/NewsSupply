import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utils/color.dart';

Widget loaderView(){
  return Center(
    child: Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12.withOpacity(0.30)),
      child: const Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SpinKitCircle(
                size: 50,
                color: ColorConst.teal,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}