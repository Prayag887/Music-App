// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicNameTile extends StatelessWidget {
  final String musicName;
  final bool isSelect;
  final VoidCallback onTap;

  MusicNameTile({
    required this.musicName,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // child: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          // padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black45,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                musicName,
                // textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  height: 1,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: isSelect ? Color(0xffdcdde2) : Color(0xff686d87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
