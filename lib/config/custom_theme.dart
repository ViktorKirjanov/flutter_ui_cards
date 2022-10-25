import 'package:flutter/material.dart';

class CustomTheme {
  static const Color white = Colors.white;
  static const Color black = Colors.black87;
  static const Color grey = Colors.black54;

  static List colors = [
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent[400],
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
  ];

  static final dartTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff23202a),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.grey[800]),
    ),
    iconTheme: const IconThemeData(
      color: white,
    ),
  );
}
