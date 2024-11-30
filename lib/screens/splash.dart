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
              image: AssetImage(ImgPaths.logo),
              height: CustomSize.height(context, 2.3),
              width: CustomSize.width(context, 0.1),
              fit: BoxFit.contain,
            ),

            // Text 1
            Transform.translate(
              offset: Offset(0, -CustomSize.height(context, 17)),
              child: CustomText("pomodoro.", UtilsColors.pink, 19,
                  FontWeight.bold, TextAlign.center, "PatuaOne"),
            ),
            Height(10.7),
          ],
        ),
      ),
    );
  }
}
