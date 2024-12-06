import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:provider/provider.dart';

void deleteOrCompleteAlertDialog(BuildContext context, int index) {
  // Dialog Shower Method
  showDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: UtilsColors.bg,
      content: SizedBox(
        height: CustomSize.height(context, 7.5),
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(0, -CustomSize.height(context, 13)),
              child: Container(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(CustomSize.width(context, 20)),
                  height: CustomSize.height(context, 9),
                  width: CustomSize.width(context, 2.3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UtilsColors.bg,
                      boxShadow: [
                        BoxShadow(
                            color: UtilsColors.black.withOpacity(0.1),
                            blurRadius: CustomSize.height(context, 20))
                      ]),
                  child: Container(
                      height: CustomSize.height(context, 13),
                      width: CustomSize.width(context, 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: UtilsColors.lightPink,
                        border:
                            Border.all(color: UtilsColors.darkPink, width: 2),
                      ),
                      child: Icon(
                        Icons.error,
                        color: UtilsColors.pink,
                        size: CustomSize.width(context, 13),
                      )),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      "Delete?",
                      UtilsColors.black,
                      CustomSize.width(context, 13.3),
                      FontWeight.w500,
                      TextAlign.center,
                      "PatuaOne"),
                  CustomText(
                    "You can not undo this!",
                    UtilsColors.black.withOpacity(0.7),
                    CustomSize.width(context, 8.3),
                    FontWeight.w500,
                    TextAlign.center,
                    "PatuaOne",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: CustomSize.height(context, 17),
                width: CustomSize.width(context, 3.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: UtilsColors.lightGrey, width: 2),
                    borderRadius:
                        BorderRadius.circular(CustomSize.width(context, 15)),
                    color: Colors.transparent),
                child: TextButton(
                  onPressed: () {
                    Provider.of<ToDoTasks>(context, listen: false)
                        .removeTask(index, context);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                      "Complete",
                      UtilsColors.black,
                      CustomSize.width(context, 8.3),
                      FontWeight.w500,
                      TextAlign.center,
                      "PatuaOne"),
                )),
            SizedBox(
              width: CustomSize.width(context, 20),
            ),
            Container(
                height: CustomSize.height(context, 17),
                width: CustomSize.width(context, 3.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(CustomSize.width(context, 15)),
                    color: UtilsColors.pink),
                child: TextButton(
                  onPressed: () {
                    Provider.of<ToDoTasks>(context, listen: false)
                        .justRemove(index);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                      "Delete",
                      UtilsColors.bg,
                      CustomSize.width(context, 8.3),
                      FontWeight.w500,
                      TextAlign.center,
                      "PatuaOne"),
                ))
          ],
        )
      ],
    ),
  );
}
