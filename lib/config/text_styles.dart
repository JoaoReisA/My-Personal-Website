import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final standardTextStyle = GoogleFonts.montserrat().copyWith(
    shadows: const [
      Shadow(color: Colors.black, blurRadius: 10, offset: Offset(1, 3)),
      Shadow(color: Colors.black, blurRadius: 10),
    ],
  );

  static final standardPurpleBoldStyle = standardTextStyle.copyWith(
      color: Colors.deepPurple, fontWeight: FontWeight.bold);

  static final standardPurpleStyle =
      standardTextStyle.copyWith(color: Colors.deepPurple);

  static final titleTextStyle =
      standardTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 65);

  static final subtitleTextStyle = standardTextStyle.copyWith(fontSize: 20);

  static final textButtonStyles = standardTextStyle.copyWith(
      color: Colors.deepPurple, fontWeight: FontWeight.bold);
}
