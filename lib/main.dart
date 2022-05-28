// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_app/pages/music_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MusicPage(),
    );
  }
}
