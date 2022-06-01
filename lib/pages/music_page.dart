// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, unused_field

// import 'dart:html';

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/pages/home_screen/app_large_text.dart';
import 'package:music_app/pages/home_screen/app_text.dart';
import 'package:music_app/pages/home_screen/music_tile.dart';
import 'package:music_app/pages/home_screen/music_type.dart';
import 'package:music_app/pages/home_screen/music_play_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/pages/musicPlayScreen/musicPlayScreen.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  List songsCover = [
    "Metallica.jpg",
    "Beatles.jpg",
    "Queens.jpg",
  ];

  final List musicType = [
    ['Recommendation', true],
    ['Trending', false],
    ['Synthwave', false],
    ['Metal', false],
    ['Rock', false],
    ['Pop', false]
  ];

  //automatickeepalive function uses garera active index banauna milxa

  void musicTypeSelected(int index) {
    setState(() {
      //sabai option lai false banaako
      for (int i = 0; i < musicType.length; i++) {
        musicType[i][1] = false;
      }
      //maathi ko false vaisakepaxi aba naya choose grda esle true banauxa
      musicType[index][1] = true;
    });
  }

  //bottomnavigation bar lai tap grna milne banaako
  late int _selectedIndexForNavbar = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexForNavbar = index;
    });
  }

  @override
  final _audioQuery = new OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();
  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      _audioPlayer.play();
    } on Exception {
      log("Error Parsing Song");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1f3e),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: 55, left: 20, right: 20),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppLargeText(text: "Hello There !", color: Color(0xffdcdde1)),
              AppText(
                text: "What do you want to hear today?",
                color: Color(0xff4b506c),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 40),

                // text field search bar jasari use gareko

                child: TextField(
                  style: TextStyle(color: Color(0xffdcdde1)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color(0xff212350),
                    hintText: "Search",
                    hintStyle:
                        TextStyle(fontSize: 20.0, color: Color(0xff4b506c)),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xffdcdde1),
                    ),
                    suffixIcon: Icon(
                      Icons.music_note,
                      color: Color(0xffdcdde1),
                    ),
                  ),
                ),
              ),

              ///navbar below the textfield alternative (tabbar)
              SizedBox(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicType.length,
                    itemBuilder: (context, index) {
                      return MusicType(
                        musictype: musicType[index][0],
                        isSelect: musicType[index][1],
                        onTap: () {
                          musicTypeSelected(index);
                        },
                      );
                    }),
              ),

              // Music Tiles that scrolls horizontally
              Container(
                height: 400,
                width: 400,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MusicTile(
                      musicImagePath: 'lib/images/cover.png',
                      musicName: 'Podcast',
                      musicGenre: 'Synthwave',
                      musicPrice: '',
                    ),
                    MusicTile(
                      musicImagePath: 'lib/images/music.png',
                      musicName: 'asd',
                      musicGenre: 'Pop',
                      musicPrice: 'Rs 150',
                    ),
                    MusicTile(
                      musicImagePath: 'lib/images/metal.png',
                      musicName: 'asdasd',
                      musicGenre: 'Rock',
                      musicPrice: 'Rs 150',
                    ),
                    MusicTile(
                      musicImagePath: 'lib/images/turtle_back.png',
                      musicName: 'asdas',
                      musicGenre: 'Ballad',
                      musicPrice: 'Rs 150',
                    ),
                    MusicTile(
                      musicImagePath: 'lib/images/planet.png',
                      musicName: 'asdas',
                      musicGenre: 'Ballad',
                      musicPrice: 'Rs 150',
                    ),
                  ],
                ),

                // CustomButton(onPressed: () { },)
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Songs',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xffdcdde1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'See All',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xffdcdde1),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 535,
                child: FutureBuilder<List<SongModel>>(
                  future: _audioQuery.querySongs(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true,
                  ),
                  builder: (context, item) {
                    if (item.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (item.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No Song Found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) => MusicNameTile(
                        // musicName:
                        //     // ignore: unnecessary_string_interpolations
                        //     item.data![index].displayNameWOExt,
                        musicImagePath: 'lib/images/cover.png',
                        // musicArtist: item.data![index].artist.toString(),
                        // musicDuration: item.data![index].duration,
                        songModel: item.data![index],
                        audioPlayer: _audioPlayer,
                        onTap: () {
                          // playSong(item.data![index].uri);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => musicPlayScreen(
                                songModel: item.data![index],
                                audioPlayer: _audioPlayer,
                              ),
                            ),
                          );
                        },
                      ),
                      itemCount: item.data!.length,
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          // boxShadow: [
          //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          // ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xff131438),
            selectedItemColor: Color(0xffc747ff),
            unselectedItemColor: Color(0xffc747ff),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.circle_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              )
            ],
          ),
        ),
      ),
    );
    //   ),
    // );
  }
}

//material button
