// ignore_for_file: must_be_immutable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  //parameters
  double size;
  final String text;
  final Color color;

  AppText({
    Key? key,
    this.size = 15,
    required this.text,
    this.color = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
