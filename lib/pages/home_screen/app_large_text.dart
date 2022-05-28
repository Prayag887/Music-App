// ignore_for_file: must_be_immutable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  //parameters
  double size;
  final String text;
  final Color color;

  AppLargeText({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
