import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/my_app_color.dart';

class MyAppStyles {
  static TextStyle bold16White = GoogleFonts.elMessiri(
      color: MyAppColor.whiteColor, fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle bold20White = GoogleFonts.elMessiri(
      color: MyAppColor.whiteColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle bold24Black = GoogleFonts.elMessiri(
      color: MyAppColor.blackColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle bold16Black = GoogleFonts.elMessiri(
      color: MyAppColor.blackColor, fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle bold20Gold = GoogleFonts.elMessiri(
      color: MyAppColor.goldColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle bold24Gold = GoogleFonts.elMessiri(
      color: MyAppColor.goldColor, fontWeight: FontWeight.bold, fontSize: 24);
}
