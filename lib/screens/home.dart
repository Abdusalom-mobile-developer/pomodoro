import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_snackbar.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/customs/custom_timer_s_q.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/customs/modal_bottom_sheet.dart';
import 'package:pomodoro/providers/home_screen_all.dart';
import 'package:pomodoro/providers/time_picking.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenAll>(
      builder: (context, provider, child) => Scaffold(
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
                if (value == 3) {
                  context.go("/instruction");
                } else if (value == 2) {
                  context.go("/completed_tasks");
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
          child: Column(
            children: [
              // App Bar Simulator
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
              Height(25),
              // Time Choosing Part
              provider.isTimerWorking && provider.isPomodoro
                  ? SizedBox(
                      height: CustomSize.height(context, 19),
                      child: CustomText(
                          provider.currentTask["task"],
                          UtilsColors.black,
                          CustomSize.height(context, 25),
                          FontWeight.w500,
                          TextAlign.center,
                          "RobotoMono"),
                    )
                  : !provider.isTimerWorking
                      ? Consumer<TimePicking>(
                          builder: (context, timePicker, child) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: CustomSize.width(context, 29)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: timePicker.buttons),
                          ),
                        )
                      : SizedBox(height: CustomSize.height(context, 19), child: CustomText(
                          "Break",
                          UtilsColors.black,
                          CustomSize.height(context, 25),
                          FontWeight.w500,
                          TextAlign.center,
                          "RobotoMono"),),
              // Time Showing Tomato Part
              Container(
                alignment: Alignment.center,
                height: CustomSize.height(context, 2.5),
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage(ImgPaths.bigTomato),
                        fit: BoxFit.fill,
                        width: CustomSize.width(context, 1.1),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: CustomSize.height(context, 12),
                            width: CustomSize.width(context, 5.3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: UtilsColors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(
                                    CustomSize.width(context, 30))),
                            child: CustomText(
                                provider.minutes.toString().padLeft(2, "0"),
                                UtilsColors.bg,
                                CustomSize.width(context, 19),
                                FontWeight.w500,
                                TextAlign.center,
                                "RobotoMono"),
                          ),
                          // Middle Double Circles
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: CustomSize.width(context, 70)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: CustomSize.width(context, 35),
                                  color: UtilsColors.bg,
                                ),
                                Height(90),
                                Icon(
                                  Icons.circle,
                                  size: CustomSize.width(context, 35),
                                  color: UtilsColors.bg,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: CustomSize.height(context, 12),
                            width: CustomSize.width(context, 5.3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: UtilsColors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(
                                    CustomSize.width(context, 30))),
                            child: CustomText(
                                provider.seconds.toString().padLeft(2, "0"),
                                UtilsColors.bg,
                                CustomSize.width(context, 19),
                                FontWeight.w500,
                                TextAlign.center,
                                "RobotoMono"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Task Picking Part
              provider.isTimerWorking
                  ? SizedBox(
                      height: CustomSize.height(context, 13),
                    )
                  : provider.isPomodoro
                      ? Container(
                          alignment: Alignment.center,
                          width: CustomSize.width(context, 1.5),
                          height: CustomSize.height(context, 13),
                          decoration: BoxDecoration(
                              color: UtilsColors.pink.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                  CustomSize.height(context, 45))),
                          child: TextButton(
                              onPressed: () {
                                MyBottomSheet.showCustomBottomSheet(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.list_alt_rounded,
                                        color: UtilsColors.pink,
                                        size: CustomSize.height(context, 33),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      CustomText(
                                        "Pick a Task",
                                        UtilsColors.pink,
                                        CustomSize.height(context, 17),
                                        FontWeight.w500,
                                        TextAlign.center,
                                        "RobotoMono",
                                      )
                                    ],
                                  ),
                                  Icon(
                                    Icons.add_rounded,
                                    color: UtilsColors.pink,
                                    size: CustomSize.height(context, 27),
                                  )
                                ],
                              )),
                        )
                      : SizedBox(
                          height: CustomSize.height(context, 13),
                        ),
              Height(30),
              // Start Button
              provider.isTimerWorking
                  ? CustomTimerSQ("Quit", () {
                      provider.isTimerWorking
                          ? provider.quitTimer(context)
                          : null;
                    })
                  : CustomTimerSQ("Start", () {
                      if (provider.isPomodoro) {
                        provider.currentTask["task"] == null
                            ? showMySnackbar(
                                context, "Choose Task to start Pomodoro!")
                            : provider.isTimerWorking
                                ? null
                                : provider.startTimer(context);
                      } else {
                        provider.isTimerWorking
                            ? null
                            : provider.startTimer(context);
                      }
                    }),
              // Quit Button
            ],
          ),
        ),
      ),
    );
  }
}

// Dialog Shower Method
void showMyDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
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
                      "Quit?",
                      UtilsColors.black,
                      CustomSize.width(context, 15),
                      FontWeight.w500,
                      TextAlign.center,
                      "PatuaOne"),
                  CustomText(
                    "You really want to quit?",
                    UtilsColors.black.withOpacity(0.7),
                    CustomSize.width(context, 9),
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
                    Navigator.pop(context);
                  },
                  child: CustomText(
                      "Cancel",
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
                    SystemNavigator.pop();
                  },
                  child: CustomText(
                      "Quit",
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
