import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_completed_task_maker.dart';
import 'package:pomodoro/customs/custom_scroll_disabler.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/providers/completed_tasks.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';
import 'package:provider/provider.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UtilsColors.bg,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: UtilsColors.bg,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 5,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                if (value == 0) {
                  context.go("/home");
                } else if (value == 3) {
                  context.go("/instruction");
                } else if (value == 1) {
                  context.go("/tasks");
                }
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "",
                  backgroundColor: Colors.white,
                  icon: Image(
                    image: AssetImage(ImgPaths.navOpt1),
                    height: CustomSize.width(context, 11),
                  ),
                  activeIcon: Image(
                    image: AssetImage(ImgPaths.navOpt1Chosen),
                    height: CustomSize.width(context, 11),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Image(
                    image: AssetImage(ImgPaths.navOpt2),
                    height: CustomSize.width(context, 11),
                  ),
                  activeIcon: Image(
                    image: AssetImage(ImgPaths.navOpt2Chosen),
                    height: CustomSize.width(context, 11),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Image(
                    image: AssetImage(ImgPaths.navOpt3),
                    height: CustomSize.width(context, 12.7),
                  ),
                  activeIcon: Image(
                    image: AssetImage(ImgPaths.navOpt3Chosen),
                    height: CustomSize.width(context, 12.7),
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Image(
                    image: AssetImage(ImgPaths.navOpt4),
                    height: CustomSize.width(context, 11),
                  ),
                  activeIcon: Image(
                    image: AssetImage(ImgPaths.navOpt4Chosen),
                    height: CustomSize.width(context, 11),
                  ))
            ]),
        body: SizedBox(
          width: double.infinity,
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: CustomSize.height(context, 3.9),
                  floating: false,
                  pinned: false,
                  shadowColor: Colors.transparent,
                  backgroundColor: UtilsColors.bg,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: ClipRect(
                            child: Container(
                              height: CustomSize.height(context, 6.5),
                              color: UtilsColors.pink,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Image(
                                          image: AssetImage(
                                              ImgPaths.appBarCircleLeft),
                                          width: CustomSize.width(context, 4),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // Big Black Tomato Center
                                      Transform.translate(
                                        offset: Offset(
                                            CustomSize.width(context, 31),
                                            -CustomSize.width(context, 90)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(
                                                ImgPaths.appBarTomatoBlack),
                                            width:
                                                CustomSize.width(context, 7.7),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      // Small Black Tomato
                                      Transform.translate(
                                        offset: Offset(
                                            CustomSize.width(context, 5.1),
                                            -CustomSize.width(context, 63)),
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Image(
                                            image: AssetImage(ImgPaths
                                                .appBarTomatoBlackSmall),
                                            width:
                                                CustomSize.width(context, 14.3),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      // Big Black Tomato Corner
                                      Transform.translate(
                                        offset: Offset(
                                            -CustomSize.width(context, 30),
                                            CustomSize.width(context, 37)),
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Image(
                                            image: AssetImage(
                                                ImgPaths.appBarTomatoBlack),
                                            width: CustomSize.width(context, 8),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text Part
                                  Transform.translate(
                                    offset: Offset(
                                        -CustomSize.width(context, 37), 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          "Pomodoro",
                                          UtilsColors.bg,
                                          CustomSize.width(context, 16.3),
                                          FontWeight.w500,
                                          TextAlign.center,
                                          "PatuaOne",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Image(
                                          image: AssetImage(
                                              ImgPaths.appBarCircleRight),
                                          width: CustomSize.width(context, 5),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // Small Black Tomato
                                      Transform.translate(
                                        offset: Offset(
                                            -CustomSize.width(context, 70),
                                            -CustomSize.width(context, 35)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Image(
                                            image: AssetImage(ImgPaths
                                                .appBarTomatoBlackSmall),
                                            width:
                                                CustomSize.width(context, 14.3),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      // Big Black Tomato Center
                                      Transform.translate(
                                        offset: Offset(
                                            CustomSize.width(context, 15),
                                            -CustomSize.width(context, 17)),
                                        child: Container(
                                          alignment: Alignment.bottomRight,
                                          child: Image(
                                            image: AssetImage(
                                                ImgPaths.appBarTomatoBlack),
                                            width:
                                                CustomSize.width(context, 7.7),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      // Big Black Tomato Left
                                      Transform.translate(
                                        offset: Offset(
                                            -CustomSize.width(context, 13.9),
                                            CustomSize.width(context, 37)),
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Image(
                                            image: AssetImage(
                                                ImgPaths.appBarTomatoBlack),
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
                        ),
                        Transform.translate(
                          offset: Offset(0, -CustomSize.height(context, 27)),
                          child: Container(
                            alignment: Alignment.center,
                            height: CustomSize.height(context, 10.3),
                            margin: EdgeInsets.symmetric(
                                horizontal: CustomSize.width(context, 13)),
                            decoration: BoxDecoration(
                                color: UtilsColors.bg,
                                boxShadow: [
                                  BoxShadow(
                                      color: UtilsColors.black.withOpacity(0.2),
                                      blurRadius:
                                          CustomSize.height(context, 55))
                                ],
                                borderRadius: BorderRadius.circular(
                                    CustomSize.width(context, 45))),
                            child: CustomText(
                              "All Completed Tasks",
                              UtilsColors.black,
                              CustomSize.width(context, 7.9),
                              FontWeight.w500,
                              TextAlign.center,
                              "RobotoMono",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<CompletedTasks>(
                  builder: (context, provider, child) => SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomSize.width(context, 13),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CustomCompletedTaskMaker(
                              provider.tasks[index].task,
                              index == provider.tasks.length - 1,
                              provider.tasks[index].time,
                              true);
                        },
                        childCount: provider.tasks.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
