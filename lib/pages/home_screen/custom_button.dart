// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   CustomButton({required this.onPressed, required String musicVer});
//   final GestureTapCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       // fillColor: Color.fromARGB(255, 158, 76, 175),
//       // splashColor: Color.fromARGB(255, 158, 76, 175),
//       child: Ink(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: const <Widget>[
//               // Icon(
//               //   Icons.face,
//               //   color: Colors.amber,
//               // ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Text(
//                 'New!!',
//                 maxLines: 1,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xffca48fd), Color(0xff9125fb)],
//             ),
//           )),
//       // onPressed: () {},
//       onPressed: onPressed,
//       shape: const StadiumBorder(),
//     );
//     // child: Padding(
//     // padding: EdgeInsets.only(top: 10.0, right: 10, bottom: 10),

//     // ),
//     //gives curved shape to button
//     // );
//   }
// }
