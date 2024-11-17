import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizedBoxHeight extends StatelessWidget {
  double number;
  SizedBoxHeight(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / number,
    );
  }
}