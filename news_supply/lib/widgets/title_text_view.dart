import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleTextView extends StatelessWidget {
  TitleTextView(this.text,
      {Key? key,
      this.textAlign,
      this.color,
      this.fontSize,
      this.softWrap,
      this.maxLines,
      this.textOverflow,
      this.fontWeight,
      this.fontStyle,
      this.isGradiant,
      this.textDecoration})
      : super(key: key);

  final String text;
  TextAlign? textAlign = TextAlign.start;
  Color? color = Colors.black;

  double? fontSize = 13;
  bool? softWrap = true;
  bool? isGradiant = false;
  int? maxLines;
  TextOverflow? textOverflow = TextOverflow.ellipsis;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
      maxLines: maxLines,
      style: TextStyle(
          color: (color == null) ? Colors.black : color,
          fontSize: (fontSize == null) ? 14 : fontSize,
          fontStyle: (fontStyle == null) ? FontStyle.normal : fontStyle,
          fontWeight: (fontWeight == null) ? FontWeight.normal : fontWeight,
          decoration:
              (textDecoration == null) ? TextDecoration.none : textDecoration),
    );
  }
}
