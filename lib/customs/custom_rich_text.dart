import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/utils/colors.dart';

// ignore: must_be_immutable
class CustomRichText extends StatelessWidget {
  String text1, text2;
  CustomRichText(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: text1,
        style: TextStyle(
          color: UtilsColors.darkPink,
          fontWeight: FontWeight.w500,
          fontFamily: "DMMono",
          fontSize: CustomSize.width(context, 21),
        ),
      ),
      TextSpan(
        text: text2,
        style: TextStyle(
          color: UtilsColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: "DMMono",
          fontSize: CustomSize.width(context, 21),
        ),
      )
    ]));
  }
}
