import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_rich_text.dart';
import 'package:pomodoro/customs/custom_scroll_disabler.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/screens/home.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
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
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showMyDialog(context);
  });
  return true;
}

  int _currentIndex = 3;
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
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
                if (value == 0) {
                  context.go("/home");
                } else if (value == 2) {
                  context.go("/completed_tasks");
                }else if (value == 1) {
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
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: CustomScrollView(
            slivers: [
              // SliverAppBar to simulate the fixed app bar
              SliverAppBar(
                pinned:
                    false, // This keeps the app bar fixed at the top while scrolling
                expandedHeight:
                    CustomSize.height(context, 6.5), // Height of the app bar
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRect(
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
                                    image:
                                        AssetImage(ImgPaths.appBarTomatoBlack),
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
                                    image: AssetImage(
                                        ImgPaths.appBarTomatoBlackSmall),
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
                                    image:
                                        AssetImage(ImgPaths.appBarTomatoBlack),
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
                                  "Instruction",
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
                                    image: AssetImage(
                                        ImgPaths.appBarTomatoBlackSmall),
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
                                    image:
                                        AssetImage(ImgPaths.appBarTomatoBlack),
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
                                    image:
                                        AssetImage(ImgPaths.appBarTomatoBlack),
                                    width: CustomSize.width(context, 8),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Instructions Part as SliverPadding
              SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: CustomSize.width(context, 27)),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Height(30),
                        CustomText(
                          "What is the Pomodoro Method?",
                          UtilsColors.darkPink,
                          CustomSize.width(context, 10.1),
                          FontWeight.w500,
                          TextAlign.left,
                          "RobotoSlab",
                        ),
                        Height(CustomSize.height(context, 10)),
                        CustomText(
                          "The Pomodoro Technique is a time management method designed to help you focus and get more done in less time. It uses short work intervals, called “Pomodoros,” followed by regular breaks to keep you productive and refreshed.",
                          UtilsColors.black,
                          CustomSize.width(context, 8.5),
                          FontWeight.w500,
                          TextAlign.left,
                          "DMMono",
                        ),
                        Height(CustomSize.height(context, 23)),
                        CustomText(
                          "How Does It Work?",
                          UtilsColors.darkPink,
                          CustomSize.width(context, 10.1),
                          FontWeight.w500,
                          TextAlign.left,
                          "RobotoSlab",
                        ),
                        Height(CustomSize.height(context, 10)),
                        CustomRichText("Choose a Task: ",
                            "Pick something you want to focus on."),
                        CustomRichText("Set a Timer: ",
                            "Work on the task for 25 minutes (1 Pomodoro)."),
                        CustomRichText("Take a Short Break: ",
                            "After 25 minutes, rest for 5 minutes."),
                        CustomRichText("Repeat: ",
                            "After 4 Pomodoros, take a longer break (15–30 minutes)."),
                        Height(CustomSize.height(context, 23)),
                        CustomText(
                          "Why Use the Pomodoro Method?",
                          UtilsColors.darkPink,
                          CustomSize.width(context, 10.1),
                          FontWeight.w500,
                          TextAlign.left,
                          "RobotoSlab",
                        ),
                        Height(CustomSize.height(context, 10)),
                        CustomRichText("Boost Productivity: ",
                            "Focus deeply for short periods."),
                        CustomRichText("Reduce Burnout: ",
                            "Regular breaks help you stay fresh."),
                        CustomRichText("Improve Time Awareness: ",
                            "Understand how long tasks take."),
                        CustomRichText(
                            "Stay Motivated: ", "Small wins keep you going!"),
                        Height(CustomSize.height(context, 23)),
                        CustomText(
                          "Tips for Success",
                          UtilsColors.darkPink,
                          CustomSize.width(context, 10.1),
                          FontWeight.w500,
                          TextAlign.left,
                          "RobotoSlab",
                        ),
                        Height(CustomSize.height(context, 10)),
                        CustomText(
                          "Eliminate distractions during your Pomodoro. Use breaks to relax, stretch, or grab a drink. Adjust intervals if needed to fit your work style.",
                          UtilsColors.black,
                          CustomSize.width(context, 8.5),
                          FontWeight.w500,
                          TextAlign.left,
                          "DMMono",
                        ),
                        Height(30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
