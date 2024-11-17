import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextAlign textAlign;
  CustomText(this.text, this.color, this.fontSize, this.fontWeight, this.textAlign,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
          color: color,
          fontSize: CustomSize.height(
            context,
            fontSize,
          ),
          fontWeight: fontWeight),
    );
  }
}
