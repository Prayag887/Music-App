// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicNameTile extends StatelessWidget {
  final String musicName;
  final String musicImagePath;
  final String musicArtist;
  final String musicDuration;
  // final bool isSelect;
  // final VoidCallback onTap;

  MusicNameTile({
    required this.musicName,
    required this.musicImagePath,
    required this.musicArtist,
    required this.musicDuration,
    // required this.isSelect,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black45,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        musicImagePath,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          musicName,
                          // textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffdcdde1),
                            // color: isSelect ? Color(0xffdcdde2) : Color(0xff686d87),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '\n$musicArtist',
                          // textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            height: 0.5,
                            fontSize: 10,
                            letterSpacing: 1,
                            // fontWeight: FontWeight.bold,
                            color: Color(0xffdcdde1),
                            // color: isSelect ? Color(0xffdcdde2) : Color(0xff686d87),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\n$musicDuration',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                letterSpacing: 1,
                                color: Color(0xffdcdde1),
                              ),
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.all(Size(20, 20)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Ink(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 104, 2, 207),
                                            Color.fromARGB(255, 209, 97, 254)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(

                                          //create a constraint so that the color gradient covers the whole button
                                          constraints: BoxConstraints(
                                            minHeight: 20,
                                            maxHeight: 30,
                                            maxWidth: 120,
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.play_arrow)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
