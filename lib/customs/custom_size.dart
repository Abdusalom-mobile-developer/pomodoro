import 'package:flutter/material.dart';

class CustomSize {
  // Custom Size maker according to the current Device's height
  static double height(BuildContext context, double number) {
    return MediaQuery.of(context).size.height / number;
  }

   // Custom Size maker according to the current Device's width
  static double width(BuildContext context, double number) {
    return MediaQuery.of(context).size.width / number;
  }
}
