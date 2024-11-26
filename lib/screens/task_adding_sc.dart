import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';

class TaskAddingSc extends StatelessWidget {
  const TaskAddingSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilsColors.bg,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // App Bar Part
            ClipRect(
              child: Container(
                height: CustomSize.height(context, 6.5),
                color: UtilsColors.pink,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Image(
                            image: AssetImage(ImgPaths.appBarCircleLeft),
                            width: CustomSize.width(context, 4),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Big Black Tomato Center
                        Transform.translate(
                          offset: Offset(CustomSize.width(context, 31),
                              -CustomSize.width(context, 90)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(ImgPaths.appBarTomatoBlack),
                              width: CustomSize.width(context, 7.7),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Small Black Tomato
                        Transform.translate(
                          offset: Offset(CustomSize.width(context, 5.1),
                              -CustomSize.width(context, 63)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Image(
                              image:
                                  AssetImage(ImgPaths.appBarTomatoBlackSmall),
                              width: CustomSize.width(context, 14.3),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Big Black Tomato Corner
                        Transform.translate(
                          offset: Offset(-CustomSize.width(context, 30),
                              CustomSize.width(context, 37)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Image(
                              image: AssetImage(ImgPaths.appBarTomatoBlack),
                              width: CustomSize.width(context, 8),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Text Part
                    Transform.translate(
                      offset: Offset(-CustomSize.width(context, 37), 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              "Pomodoro",
                              UtilsColors.bg,
                              CustomSize.width(context, 16.3),
                              FontWeight.w500,
                              TextAlign.center,
                              "PatuaOne"),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            image: AssetImage(ImgPaths.appBarCircleRight),
                            width: CustomSize.width(context, 5),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Small Black Tomato
                        Transform.translate(
                          offset: Offset(-CustomSize.width(context, 70),
                              -CustomSize.width(context, 35)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Image(
                              image:
                                  AssetImage(ImgPaths.appBarTomatoBlackSmall),
                              width: CustomSize.width(context, 14.3),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Big Black Tomato Center
                        Transform.translate(
                          offset: Offset(CustomSize.width(context, 15),
                              -CustomSize.width(context, 17)),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Image(
                              image: AssetImage(ImgPaths.appBarTomatoBlack),
                              width: CustomSize.width(context, 7.7),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Big Black Tomato Left
                        Transform.translate(
                          offset: Offset(-CustomSize.width(context, 13.9),
                              CustomSize.width(context, 37)),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage(ImgPaths.appBarTomatoBlack),
                              width: CustomSize.width(context, 8),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Height(30),
            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left Button
                Container(
                  alignment: Alignment.center,
                  width: CustomSize.width(context, 3),
                  height: CustomSize.height(context, 13.7),
                  decoration: BoxDecoration(
                    color: UtilsColors.pink,
                    borderRadius:
                        BorderRadius.circular(CustomSize.width(context, 35)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        context.go("/tasks");
                      },
                      child: CustomText(
                          "Back",
                          UtilsColors.bg,
                          CustomSize.height(context, 19),
                          FontWeight.w500,
                          TextAlign.center,
                          "Inter")),
                ),
                SizedBox(
                  width: CustomSize.width(context, 25),
                ),
                // Right Button
                Container(
                  alignment: Alignment.center,
                  width: CustomSize.width(context, 3),
                  height: CustomSize.height(context, 13.7),
                  decoration: BoxDecoration(
                    color: UtilsColors.pink,
                    borderRadius:
                        BorderRadius.circular(CustomSize.width(context, 35)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: CustomText(
                              "Add ",
                              UtilsColors.bg,
                              CustomSize.height(context, 19),
                              FontWeight.w500,
                              TextAlign.center,
                              "Inter")),
                      Icon(Icons.add_rounded,
                          color: UtilsColors.bg,
                          size: CustomSize.height(context, 31))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
