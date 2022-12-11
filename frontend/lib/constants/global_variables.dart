import 'package:flutter/material.dart';

String baseURL = 'http://192.168.1.3:3000';

class GlobalVariables {
  //----------------
  // START OF COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  // END OF COLORS
  //----------------

  //-------------------
  //START OF TYPOGRAPHY
  static const double textXL = 22;
  static const double textLG = 20;
  static const double textMD = 18;
  static const double textXS = 12;
  //END OF TYPOGRAPHY
  //-------------------

  //---------------------
  //START OF GLOBAL NAMES
  static const authToken = 'x-auth-token';
  //END OF GLOBAL NAMES
  //----------------------

}
