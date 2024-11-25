import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/utils/colors.dart';

// ignore: must_be_immutable
class CustomCompletedTaskMaker extends StatelessWidget {
  String content, time;
  bool isLast, isCompleted;
  CustomCompletedTaskMaker(
      this.content, this.isLast, this.time, this.isCompleted,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: CustomSize.width(context, 30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        color: UtilsColors.black.withOpacity(0.5),
                        fontSize: CustomSize.height(context, 47),
                        fontFamily: "Inter",
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: UtilsColors.black.withOpacity(0.5)),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: UtilsColors.black.withOpacity(0.5),
                      fontSize: CustomSize.height(context, 57),
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
              Icon(
                isCompleted ? Icons.check_circle : Icons.circle_outlined,
                color: UtilsColors.pink,
                size: CustomSize.height(context, 29),
              )
            ],
          ),
        ),
        Height(210),
        isLast
            ? const SizedBox.shrink()
            : Divider(
                color: UtilsColors.black.withOpacity(0.4),
                thickness: 1.5,
              )
      ],
    );
  }
}
