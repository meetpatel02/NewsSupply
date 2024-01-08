import 'package:flutter/material.dart';

const Color mColorAccent = Color(0xffe01f25);
const Color mColorWhite = Colors.white;
const Color mColorBlack = Colors.black;
const Color mColorDivider = Colors.black12;
const Color mColorTransparent = Colors.transparent;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class ColorConst {
  static const themeColor = Color(0xFF0F4EA5);
  static const white = Colors.white;
  static const teal = Color(0xFF0FA298);
  static const appVersion = Color(0xFFADADAD);
  static const blue = Color(0xFF0F4EA5);
  static const container = Color(0xFFEBEBEB);
  static const yellow = Color(0xFFE29A57);
  static const green = Color(0xFF3DB22A);
  static const red = Color(0xFFBA3030);
  static const dRed = Color(0xFFBA3030);
  static const orange = Color(0xFFEA712D);
  static const darkOrange = Color(0xFFEA712D);
  static const purple = Color(0xFF5A2FD4);
  static const pink = Color(0xFFF436BF);
  static const dGreen = Color(0xFF2C7908);
  static const skyBlue = Color(0xFF1DB4D6);
  static const darkSkyBlue = Color(0xFF1582a3);
  static const dimBlack = Color(0xFF1E1E1E);
  static const grey = Color(0xFF807676);
  static const divider = Color(0xFFE8E8E8);
  static const backgroundDark = Color(0xFF2C3E50);
  static const darkPink = Color(0xFFA91079);
  static const brown = Color(0XFF461111);
  static const darkGrey = Color(0xFF334756);

  static const containerBgColor = Color(0xFFF5C243);
  static const bgColor = Color(0xFFF1F0E9);
  static const textColor = Color(0xFFA44A3F);
}
