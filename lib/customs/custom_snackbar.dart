// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pomodoro/customs/custom_size.dart';
import 'package:pomodoro/customs/custom_text.dart';
import 'package:pomodoro/utils/colors.dart';

void showMySnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      snackBarAnimationStyle: AnimationStyle(
          curve: Curves.easeInBack,
          duration: const Duration(milliseconds: 450)),
      SnackBar(
          duration: const Duration(milliseconds: 1900),
          backgroundColor: UtilsColors.pink,
          content: CustomText(
              content,
              UtilsColors.bg,
              CustomSize.height(context, 15),
              FontWeight.w500,
              TextAlign.center,
              "Inter")));
}
