import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/moduls/all_tasks_modul.dart';
import 'package:pomodoro/providers/to_do_tasks.dart';
import 'package:pomodoro/screens/home.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';
import 'package:provider/provider.dart';

class TaskAddingSc extends StatefulWidget {
  const TaskAddingSc({super.key});

  @override
  State<TaskAddingSc> createState() => _TaskAddingScState();
}

class _TaskAddingScState extends State<TaskAddingSc> {
  

    @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    showMyDialog(context);
    return true;
  }

  TextEditingController controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilsColors.bg,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: CustomSize.height(context, 25)),
          child: Column(children: [
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
            Height(23),
            // Bottom Buttons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: CustomSize.width(context, 13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _focusNode.requestFocus();
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: CustomSize.height(context, 8.7),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: UtilsColors.pink,
                              width: CustomSize.height(context, 300)),
                          borderRadius: BorderRadius.circular(
                              CustomSize.width(context, 35))),
                      child: TextField(
                        focusNode: _focusNode,
                        controller: controller,
                        onSubmitted: (value) {
                          controller.clear();
                        },
                        cursorColor: UtilsColors.black,
                        style: TextStyle(
                            color: UtilsColors.black,
                            fontSize: CustomSize.height(context, 43),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            decoration: TextDecoration.none,
                            decorationThickness: 0,
                            decorationColor: Colors.transparent),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Task title",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: UtilsColors.black,
                                fontSize: CustomSize.height(context, 43))),
                      ),
                    ),
                  ),
                  Height(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: CustomSize.width(context, 6.7),
                        height: CustomSize.height(context, 13),
                        decoration: BoxDecoration(
                            color: UtilsColors.pink, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              context.go("/tasks");
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: UtilsColors.bg,
                              size: CustomSize.height(context, 35),
                            )),
                      ),
                      // Right Button
                      Container(
                        alignment: Alignment.center,
                        width: CustomSize.width(context, 2.9),
                        height: CustomSize.height(context, 13.5),
                        decoration: BoxDecoration(
                            color: UtilsColors.pink,
                            borderRadius: BorderRadius.circular(
                                CustomSize.height(context, 45))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Provider.of<ToDoTasks>(context, listen: false)
                                      .addNewTask(AllTasksModul(
                                          controller.text.trim().substring(0, 1).toUpperCase()+controller.text.trim().substring(1),
                                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"));
                                  context.go("/tasks");
                                },
                                child: CustomText(
                                    "Add ",
                                    UtilsColors.bg,
                                    CustomSize.height(context, 19),
                                    FontWeight.w500,
                                    TextAlign.center,
                                    "Inter")),
                            
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Left Button
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: CustomSize.width(context, 3),
                  //   height: CustomSize.height(context, 13.7),
                  //   decoration: BoxDecoration(
                  //     color: Colors.transparent,
                  //     border: Border.all(
                  //         color: UtilsColors.pink,
                  //         width: CustomSize.height(context, 300)),
                  //     borderRadius:
                  //         BorderRadius.circular(CustomSize.width(context, 35)),
                  //   ),
                  //   child: TextButton(
                  //       onPressed: () {
                  //         context.go("/tasks");
                  //       },
                  //       child: CustomText(
                  //           "Back",
                  //           UtilsColors.pink,
                  //           CustomSize.height(context, 19),
                  //           FontWeight.w500,
                  //           TextAlign.center,
                  //           "Inter")),
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
