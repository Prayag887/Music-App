// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';

class musicPlayScreen extends StatefulWidget {
  musicPlayScreen(
      {Key? key, required this.songModel, required this.audioPlayer})
      : super(key: key);
  final SongModel songModel;
  final AudioPlayer audioPlayer;

  @override
  State<musicPlayScreen> createState() => _musicPlayScreenState();
}

class _musicPlayScreenState extends State<musicPlayScreen> {
  // final AudioPlayer _audioPlayer = AudioPlayer();
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
        AudioSource.uri(
          Uri.parse(widget.songModel.uri!),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: '${widget.songModel.id}',
            // Metadata to display in the notification:
            album: "${widget.songModel.album}",
            title: widget.songModel.displayNameWOExt,
            artUri: Uri.parse('https://example.com/albumart.jpg'),
          ),
        ),
      );
      widget.audioPlayer.play();
      isPlaying = true;
    } on Exception {
      log("Cant Parse song");
    }
    widget.audioPlayer.durationStream.listen((d) {
      setState(() {
        _duration = d!;
      });
    });
    widget.audioPlayer.positionStream.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1f3e),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Color(0xffdcdde1)),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      child: Icon(
                        Icons.music_note,
                        size: 80,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.songModel.displayNameWOExt,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xffdcdde1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.songModel.artist.toString() == "<unknown>"
                          ? "Unknown Artist"
                          : widget.songModel.artist.toString(),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20, color: Color(0xffdcdde1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          _position.toString().split(".")[0],
                          style: TextStyle(
                            color: Color(0xffdcdde1),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                              min: Duration(microseconds: 0)
                                  .inSeconds
                                  .toDouble(),
                              value: _position.inSeconds.toDouble(),
                              max: _duration.inSeconds.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  changeToSeconds(value.toInt());
                                  value = value;
                                });
                              }),
                        ),
                        Text(
                          _duration.toString().split(".")[0],
                          style: TextStyle(
                            color: Color(0xffdcdde1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            size: 40,
                            color: Color(0xffdcdde1),
                          ),
                        ),
                        IconButton(
                          constraints: const BoxConstraints(
                            minWidth: 80,
                            minHeight: 80,
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
                          icon: SizedBox(
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
                                  alignment: Alignment.center,
                                  child: Icon(
                                    isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    size: 40,
                                    color: Color(0xffdcdde1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //     child: Ink(
                        //       width: 50,
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         gradient: LinearGradient(
                        //           colors: [
                        //             Color.fromARGB(255, 104, 2, 207),
                        //             Color.fromARGB(255, 209, 97, 254),
                        //           ],
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight,
                        //         ),
                        //       ),
                        //       child: Container(
                        //         //create a constraint so that the color gradient covers the whole button
                        //         // constraints: BoxConstraints(
                        //         //   minHeight: 20,
                        //         //   maxHeight: 30,
                        //         // ),
                        //         alignment: Alignment.center,
                        //         child: Icon(
                        //           isPlaying
                        //               ? Icons.pause
                        //               : Icons.play_arrow_rounded,
                        //           size: 40,
                        //           color: Color(0xffdcdde1),
                        //         ),
                        //       ),
                        //     ),
                        //   ),

                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.skip_next_rounded,
                              size: 40, color: Color(0xffdcdde1)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    //   ),
    // );
  }

  void changeToSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    widget.audioPlayer.seek(duration);
  }
}
