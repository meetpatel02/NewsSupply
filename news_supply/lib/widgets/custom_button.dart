// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:news_supply/widgets/title_text_view.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.color,
      required this.borderRadius})
      : super(key: key);
  final dynamic child;
  final dynamic onPressed;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(10),
      color: color,
      child: child,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}

class CustomButton extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  double? fontSize;
  final String text;
  final Color borderColor;
  final Color textColor;
  Color? bgColor;
  final dynamic onTap;

  CustomButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.borderColor,
    required this.textColor,
    this.radius,
    this.fontSize,
    this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50),
            border: Border.all(color: borderColor)),
        child: CupertinoButton(
          color: bgColor,
          padding: const EdgeInsets.all(10),
          onPressed: onTap,
          borderRadius: BorderRadius.circular(radius ?? 50),
          child: TitleTextView(
            text,
            fontSize: fontSize??15,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ));
  }
}
