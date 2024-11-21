import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/utils/colors.dart';

// ignore: must_be_immutable
class CustomTimerButtons extends StatelessWidget {
  String content;
  bool isPressed;

  CustomTimerButtons(this.isPressed, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: CustomSize.height(context, 19),
      padding: EdgeInsets.symmetric(horizontal: CustomSize.width(context, 100)),
      decoration: BoxDecoration(
          border: Border.all(
              color: isPressed ? Colors.transparent : UtilsColors.lightGrey,
              width: 2),
          color: isPressed ? UtilsColors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(CustomSize.width(context, 27))),
      child: TextButton(
        onPressed: () {},
        child: CustomText(
            content,
            isPressed ? UtilsColors.bg : UtilsColors.black,
            CustomSize.width(context, 6.3),
            FontWeight.w600,
            TextAlign.center,
            "RobotoMono"),
      ),
    );
  }
}
