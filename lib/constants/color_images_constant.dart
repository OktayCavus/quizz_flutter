import 'package:flutter/material.dart';

imagePath(String name) {
  return 'assets/images/$name.png';
}

class CustomColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

  static const Color scaffoldBackgroundColor = Color(0xff21254A);
  static const Color textButtonColor = Color(0xFFF48FB1);
  static const Color buttonTextColor = Color(0xffffffff);
  static const Color buttonColor = Color.fromARGB(255, 0, 0, 0);
  static const Color textFieldFillColor = Color.fromARGB(255, 250, 244, 244);
}

class Images {
  static const String google = "assets/images/google.png";
  static const String wavingHand = "assets/images/wavingHand.png";
  static const String greenCheckMark = "assets/images/green_checkmark.png";
  static const String highestCountry = "assets/images/highest_country.jpeg";
}
