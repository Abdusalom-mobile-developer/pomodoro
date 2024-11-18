import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Height extends StatelessWidget {
  double number;
  Height(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / number,
    );
  }
}
