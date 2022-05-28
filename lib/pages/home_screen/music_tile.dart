// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_print, unused_label, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicTile extends StatelessWidget {
  final String musicImagePath;
  final String musicName;
  final String musicPrice;
  final String musicGenre;

  MusicTile({
    required this.musicImagePath,
    required this.musicName,
    required this.musicPrice,
    required this.musicGenre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 10),
        width: 350,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: Colors.black45,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                musicImagePath,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 240, right: 15),
              child: SizedBox(
                width: 400, // <-- match_parent
                height: 50, // <-- match-parent

                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff2a1253)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(110.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(

                            //create a constraint so that the color gradient covers the whole button
                            constraints: BoxConstraints(
                              minHeight: 20,
                              maxHeight: 30,
                              maxWidth: 80,
                            ),
                            alignment: Alignment.center,
                            child: Text('New')),
                      ),

                      //music genre alignment and styling

                      Text(
                        musicName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.7),
                      ),

                      // Text(
                      //   musicGenre,
                      //   style: TextStyle(
                      //     fontStyle: FontStyle.italic,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
