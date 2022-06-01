// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicType extends StatelessWidget {
  final String musictype;
  final bool isSelect;
  final VoidCallback onTap;

  MusicType({
    required this.musictype,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Text(
                musictype,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  height: 1,
                  fontSize: 13,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: isSelect ? Color(0xffdcdde2) : Color(0xff686d87),
                  // decoration:
                  //     isSelect ? TextDecoration.underline : TextDecoration.none,
                  // decorationColor: Color(0xff7228bf),
                  // decorationThickness: 3,
                  // decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: isSelect ? Color(0xffce4ff3) : Colors.transparent,
                ),
                // color: Color(0xff7228bf),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
