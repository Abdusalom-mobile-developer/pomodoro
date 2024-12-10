import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/providers/time_picking.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:provider/provider.dart';

typedef AnonymousFunc = void Function();

// ignore: must_be_immutable
class CustomTimerButtons extends StatelessWidget {
  String content;
  bool isPressed;
  int id;

  CustomTimerButtons(this.isPressed, this.content, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: CustomSize.height(context, 19.3),
      padding: EdgeInsets.symmetric(horizontal: CustomSize.width(context, 100)),
      decoration: BoxDecoration(
          border: Border.all(
              color: isPressed ? Colors.transparent : UtilsColors.lightGrey,
              width: 2),
          color: isPressed ? UtilsColors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(CustomSize.width(context, 27))),
      child: TextButton(
        onPressed: () {
          Provider.of<TimePicking>(context, listen: false)
              .changeCurrentTimer(id, context);
        },
        child: CustomText(
            content,
            isPressed ? UtilsColors.bg : UtilsColors.black,
            CustomSize.width(context, 6.1),
            FontWeight.w600,
            TextAlign.center,
            "RobotoMono"),
      ),
    );
  }
}
