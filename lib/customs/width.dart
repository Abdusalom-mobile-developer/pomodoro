import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Width extends StatelessWidget {
  double number;
  Width(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / number,
    );
  }
}