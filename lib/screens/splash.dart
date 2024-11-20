import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/customs/height.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/img_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2300),
      () => context.go("/home"),
    );
    return Scaffold(
      backgroundColor: UtilsColors.bg,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pomodoro Img
            Image(
              image: AssetImage(ImgPaths.splashTomato),
              height: CustomSize.height(context, 4),
              fit: BoxFit.fill,
            ),
            Height(37),
            // Text 1
            CustomText("Master Your Time", UtilsColors.black.withOpacity(0.8),
                25, FontWeight.bold, TextAlign.center, "PatuaOne"),
            Height(280),
            // Text 2
            SizedBox(
              width: CustomSize.width(context, 1.3),
              child: CustomText(
                  "Boost your productivity and achieve your goals with ease.",
                  UtilsColors.black.withOpacity(0.7),
                  45,
                  FontWeight.w500,
                  TextAlign.center, "PatuaOne"),
            ),
            Height(13),
          ],
        ),
      ),
    );
  }
}
