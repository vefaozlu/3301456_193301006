import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPackage {
  static TextStyle normalTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.normal, color: color);
  }

  static TextStyle boldTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle mediumTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.w500, color: color);
  }

  static TextStyle lightTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.w300, color: color);
  }

  static TextStyle extraLightTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.w200, color: color);
  }

  static TextStyle thinTextStyle(Color color) {
    return GoogleFonts.poppins(fontWeight: FontWeight.w100, color: color);
  }
}
