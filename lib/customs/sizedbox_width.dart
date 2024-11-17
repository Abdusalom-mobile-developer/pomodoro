import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizedBoxWidth extends StatelessWidget {
  double number;
  SizedBoxWidth(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / number,
    );
  }
}