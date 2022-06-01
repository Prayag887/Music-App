// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicNameTile extends StatefulWidget {
  // final String musicName;
  final String musicImagePath;
  // final String musicArtist;
  // final int? musicDuration;
  final AudioPlayer audioPlayer;
  final VoidCallback onTap;
  final SongModel songModel;

  MusicNameTile({
    // required this.musicName,
    required this.musicImagePath,
    // required this.musicArtist,
    // required this.musicDuration,
    // required this.isSelect,
    required this.onTap,
    required this.audioPlayer,
    required this.songModel,
  });

  @override
  State<MusicNameTile> createState() => _MusicNameTileState();
}

class _MusicNameTileState extends State<MusicNameTile> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playSong();
  }

  void playSong() {
    try {
      widget.audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(widget.songModel.uri!)),
      );
      widget.audioPlayer.pause();
      isPlaying = false;
    } on Exception {
      log("Cant Parse song");
    }
    widget.audioPlayer.durationStream.listen((d) {
      setState(() {
        _duration = d!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      // child: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
            // padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black45,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black45,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        widget.musicImagePath,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4, left: 5, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                        child: Container(
                          width: 250,
                          height: 30,
                          child: Text(
                            widget.songModel.displayNameWOExt,
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              // letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffdcdde1),
                              // color: isSelect ? Color(0xffdcdde2) : Color(0xff686d87),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '\n\n${widget.songModel.artist.toString()}',
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
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\n${_duration.toString().split(".")[0]}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                letterSpacing: 1,
                                color: Color(0xffdcdde1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: SizedBox(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all(Size(50, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shape:
                                        MaterialStateProperty.all<CircleBorder>(
                                      CircleBorder(),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (isPlaying) {
                                        widget.audioPlayer.pause();
                                      } else {
                                        widget.audioPlayer.play();
                                      }
                                      isPlaying = !isPlaying;
                                    });
                                  },
                                  child: SizedBox(
                                    child: Ink(
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
                                          minWidth: 30,
                                          minHeight: 30,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          isPlaying
                                              ? Icons.pause_rounded
                                              : Icons.play_arrow_rounded,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
