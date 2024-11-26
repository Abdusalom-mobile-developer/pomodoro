import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/utils/colors.dart';

typedef AnonymousFunc = void Function();

// ignore: must_be_immutable
class CustomButtonAdd extends StatelessWidget {
  String text;
  AnonymousFunc function;

  CustomButtonAdd(this.text, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: CustomSize.width(context, 1.9),
      height: CustomSize.height(context, 13.5),
      decoration: BoxDecoration(
          color: UtilsColors.pink,
          borderRadius: BorderRadius.circular(CustomSize.height(context, 45))),
      child: TextButton(
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: "RobotoMono",
                    color: UtilsColors.bg,
                    fontSize: CustomSize.height(context, 43)),
              ),
              Icon(Icons.add_rounded,
                  color: UtilsColors.bg, size: CustomSize.height(context, 25))
            ],
          )),
    );
  }
}
