import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/utils/colors.dart';

typedef AnonymousFunc = void Function();

// ignore: must_be_immutable
class CustomTimerSQ extends StatelessWidget {
  String text;
  AnonymousFunc function;

  CustomTimerSQ(this.text, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: CustomSize.width(context, 4)),
      alignment: Alignment.center,
      // width: CustomSize.width(context, 1.9),
      // height: CustomSize.height(context, 13.5),
      decoration: BoxDecoration(
          color: UtilsColors.pink,
          borderRadius: BorderRadius.circular(CustomSize.height(context, 45))),
      child: TextButton(
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size(
                CustomSize.width(context, 1.9),
                CustomSize.height(context, 13.5))),
          ),
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "RobotoMono",
                color: UtilsColors.bg,
                fontSize: CustomSize.height(context, 43)),
          )),
    );
  }
}
